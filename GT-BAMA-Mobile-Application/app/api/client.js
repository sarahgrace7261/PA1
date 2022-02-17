import {create} from 'apisauce';

const apiClient = create({
    baseURL: 'https://gt-admin-api.herokuapp.com/api'
});

export default apiClient;