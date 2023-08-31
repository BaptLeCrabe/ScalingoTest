<script>
export default {
    props: {
        item: {
            type: Object,
            default() {
                return {};
            }
        }
    },
    data() {
        return {
        }
    }
}
</script>

<template>
     <v-list-item :title="item.date.split('T')[0]">
        <template #subtitle>
            <span class="font-weight-bold">weight:</span> {{ item.weight + " kg" }}
        </template>
    </v-list-item>
</template>
