import client from "./client";

const endpoint = "/exhibit";

const getExhibits = () => client.get(endpoint);


export default {
    getExhibits,
};
