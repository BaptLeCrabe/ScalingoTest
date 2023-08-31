<script>
import axios from "axios"

export default {
    emits: ['harvest-created'],
    data() {
        return {
            serverUrl: "http://localhost:3000",
            dialog: false,
            harvestWeight: null,
            harvestDate: null,
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
            return !(this.harvestDate && this.weightRules[0](this.harvestWeight) === true);
        },
    },
    methods: {
        setHarvest(newHarvest) {
            axios.post(this.serverUrl + '/harvests', newHarvest)
                .then(() => {
                    alert("New harvest created");
                    this.$emit('harvest-created');
                    this.harvestDate = "";
                    this.harvestWeight = "";
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
            add harvest
        </v-btn>
    </template>

    <v-card class="pa-5" width="415">
        <v-card-text class="pa-2">
            <v-date-picker v-model="harvestDate" variant="solo" label="harvest date"></v-date-picker>
            <v-text-field v-model="harvestWeight" class="mt-2" variant="solo" :rules="weightRules" label="harvest weight">
                <template #append-inner>
                    <img height="24" width="24" src="/weight-kilogram.svg" alt="">
                </template>
            </v-text-field>
        </v-card-text>
        <v-card-actions class="mt-5">
            <v-btn variant="tonal" color="red" @click="dialog = false">
                cancel
            </v-btn>

            <v-btn :disabled="isAddButtonDisabled" variant="tonal" color="success" @click="setHarvest({date: harvestDate, weight: harvestWeight, hive_id: $route.params.id})">
                confirm
            </v-btn>

        </v-card-actions>
    </v-card>
</v-dialog>
</template>
