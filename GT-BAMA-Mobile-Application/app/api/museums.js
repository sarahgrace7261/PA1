import client from "./client";

const endpoint = "/museum";

const getMuseums = () => client.get(endpoint);


export default {
    getMuseums,
};
