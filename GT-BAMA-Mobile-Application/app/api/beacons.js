import client from "./client";

const endpoint = "/bluetooth";

const getBeacons = () => client.get(endpoint);


export default {
    getBeacons,
};
