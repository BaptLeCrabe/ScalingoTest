<script>
import axios from "axios"
import HiveItemDetails from "../components/hives/HiveItemDetails.vue";
import HiveItemImageUpload from "../components/hives/HiveItemImageUpload.vue";
import HarvestItemsList from "../components/harvests/HarvestItemsList.vue";
import HarvestItemNew from "../components/harvests/HarvestItemNew.vue";

export default {
    components: {
        HiveItemDetails,
        HiveItemImageUpload,
        HarvestItemsList,
        HarvestItemNew
    },
    data() {
        return {
            serverUrl: "http://localhost:3000",
            hive: false,
            url: null,
            harvests: [],
        }
    },
    created() {
        this.getHive();
    },
    methods: {
        sethive(data) {
            this.hive = data;
        },
        getHive() {
            axios.get(this.serverUrl + '/hives/' + this.$route.params.id)
                .then((response) => {
                    this.sethive(response.data);
                    this.getHarvests();
                })
                .catch(function (error) {
                    alert(error.message);
                });
        },
        setHarvests(data) {
            this.harvests = data;
        },
        getHarvests() {
            axios.get(this.serverUrl + '/harvests')
                .then((response) => {
                    this.setHarvests(response.data);
                })
                .catch(function (error) {
                    alert(error.message);
                });
        },
    },
}
</script>

<template>
<v-container>
    <router-link to="/">
        <v-btn density="compact">{{ '< back' }}</v-btn>
    </router-link>
    <v-row class="mt-5">
        <v-col sm="12" md="8" lg="6" offset-lg="2">
            <HiveItemDetails v-if="hive" :hive="hive" />
            <HiveItemImageUpload v-if="hive" :hive="hive" />
            <v-divider class="mt-5"></v-divider>

            <v-list lines="two" max-height="80vh">
                <v-list-subheader>harvests:</v-list-subheader>

                <div v-for="(item, index) in harvests" :key="index">
                    <HarvestItemsList :item="item" />

                    <v-divider v-if="index < harvests.length - 1" inset></v-divider>
                </div>
            </v-list>
            <HarvestItemNew @harvest-created="getHarvests()" />
        </v-col>
    </v-row>
</v-container>
</template>
