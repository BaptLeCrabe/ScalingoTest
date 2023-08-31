<script>
import axios from "axios"

export default {
    emits: ['hive-created'],
    data() {
        return {
            serverUrl: "http://localhost:3000",
            dialog: false,
            hiveName: "",
            hiveWeight: "",
            nameRules: [
                value => {
                    if (value.length >= 6 && value) return true

                    return 'First name must be at least 6 characters.'
                },
            ],
            weightRules: [
                value => {
                    if (!isNaN(parseFloat(value)) && value) return true

                    return 'Weight have to be digits.'
                },
            ],
        }
    },
    computed: {
        isAddButtonDisabled() {
            return !(this.nameRules[0](this.hiveName) === true && this.weightRules[0](this.hiveWeight) === true);
        },
    },
    methods: {
        setHive(newHive) {
            axios.post(this.serverUrl + '/hives', newHive)
                .then(() => {
                    alert("New hive created");
                    this.$emit('hive-created');
                    this.hiveName = "";
                    this.hiveWeight = "";
                    this.dialog = false;
                })
                .catch(function (error) {
                    alert(error.message);
                });
            }
    },
}
</script>

<template>
<v-dialog v-model="dialog" width="auto">
    <template #activator="{ props }">
        <v-btn class="mt-5" color="primary" v-bind="props">
            New Hive
        </v-btn>
    </template>

    <v-card class="pa-5">
        <v-card-text class="pa-2">
            <v-text-field v-model="hiveName" variant="solo" :rules="nameRules" label="hive name"></v-text-field>
            <v-text-field v-model="hiveWeight" variant="solo" :rules="weightRules" label="hive weight"> <template #append-inner>
                    <img height="24" width="24" src="/weight-kilogram.svg" alt="">
                </template>
            </v-text-field>
        </v-card-text>
        <v-card-actions class="mt-5">
            <v-btn variant="tonal" color="red" @click="dialog = false">
                cancel
            </v-btn>

            <v-btn :disabled="isAddButtonDisabled" variant="tonal" color="success" @click="setHive({name: hiveName, weight: hiveWeight})">
                create new hive
            </v-btn>

        </v-card-actions>
    </v-card>
</v-dialog>
</template>
