<script>
export default {
    props: {
        item: {
            type: Object,
            default () {
                return {};
            }
        }
        
    },
    data() {
        return {
            serverUrl: "http://localhost:3000",
        }
    }
}
</script>

<template>
    <v-list-item :prepend-avatar="item.picture.url ? serverUrl + item.picture.url : 'https://media.wired.com/photos/5bb532b7f8a2e62d0bd5c4e3/1:1/w_1800,h_1800,c_limit/bee-146810332.jpg'" :title="item.name">
        <template #subtitle>
            <span class="font-weight-bold">weight:</span> {{ item.weight + " kg" }}
        </template>

        <template #append>
            <router-link :to="'/hives/'+item.id">
                <v-btn color="grey-lighten-1"  variant="text">more</v-btn>
            </router-link>
        </template>
    </v-list-item>
</template>
