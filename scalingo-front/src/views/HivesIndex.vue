<script>
import axios from "axios"
import HiveItemsList from "../components/hives/HiveItemsList.vue"
import HiveItemNew from "../components/hives/HiveItemNew.vue"

export default {
    components: {
        HiveItemsList,
        HiveItemNew
    },
    data() {
        return {
            serverUrl: "http://localhost:3000",
            hives: [],
        }
    },
    created() {
        this.getHives();
    },
    methods: {
        sethives(data) {
            this.hives = data;
        },
        getHives() {
            axios.get(this.serverUrl + '/hives')
                .then((response) => {
                    this.sethives(response.data);
                })
                .catch(function (error) {
                    alert(error.message);
                });
        }
    },
}
</script>

<template>
<v-container>
    <v-row class="mt-5">
        <v-col sm="12" md="8" lg="6" offset-lg="2">
            <v-card class="mx-auto">
                <v-list lines="two" max-height="80vh">
                    <v-list-subheader>Hives</v-list-subheader>

                    <div v-for="(item, index) in hives" :key="index">
                        <HiveItemsList :item="item" />
                        <v-divider v-if="index < hives.length - 1" inset></v-divider>
                    </div>
                </v-list>
            </v-card>
            <HiveItemNew @hive-created="getHives()" />
        </v-col>
    </v-row>
</v-container>
</template>
