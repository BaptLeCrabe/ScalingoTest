

<script>
import axios from "axios"

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
        return {
            serverUrl: "http://localhost:3000",
            url: null,
            imageData: null
        }
    },
    mounted() {
        this.url = this.serverUrl + this.hive.picture.url;
    },
    methods: {
        createNestedFormData() {
            const formData = new FormData();
            formData.append('hive[picture]', this.imageData[0]);

            return formData;
        },
        onUpload() {
            axios.put(
                    this.serverUrl + "/hives/" + this.$route.params.id, this.createNestedFormData(), {
                        headers: {
                            "Content-Type": "multipart/form-data"
                        }
                    }
                )
                .then(() => {
                    alert("image updated");
                    this.imageData = null;
                })
                .catch(error => {
                    alert(error.message);
                })

        },
        setImagePreview() {
            this.url = URL.createObjectURL(this.imageData[0]);
        },
    },
}
</script>

<template>
    <div>
        <v-img :src="url"></v-img>
        <v-file-input v-model="imageData" class="mt-2" label="picture input" variant="solo" prepend-icon="" @change="setImagePreview"></v-file-input>
        <v-btn :disabled="!imageData" color="primary" @click="onUpload">Add image to hive</v-btn>
    </div>
</template>
