<script>
export default {
    props: {
        hive: {
            type: Object,
            default () {
                return {};
            }
        }
    },
    data() {
        return {}
    }
}
</script>

<template>
<div>
    <h1>Hive Details</h1>
    <h3>name: {{ hive.name }}</h3>
    <h3>weight: {{ hive.weight }}</h3>
    <h3>created at: {{ hive.created_at?.split('T')[0] }}</h3>
    <h3>last update: {{ hive.updated_at?.split('T')[0] }}</h3>
</div>
</template>
