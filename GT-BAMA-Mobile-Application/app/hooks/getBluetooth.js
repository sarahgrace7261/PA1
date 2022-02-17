import { BleManager } from "react-native-ble-plx";
import beaconsApi from "../api/beacons";
import useApi from "./useApi";


export default scan(() => {
    manager = new BleManager();
    scannedItems = [];
    const getBeaconsApi = useApi(beaconsApi.getBeacons);

    manager.startDeviceScan(null, null, (error, device) => {
        scannedItems.push(device);
    });
    setTimeout(() => {
        manager.stopDeviceScan();

        let newScanned = [];
        scannedItems.forEach(element => {
            getBeaconsApi.data.forEach(b => {
                if (element.id === b.uuid) {
                    newScanned.push(element);
                    newScanned.map(obj => ({
                        ...obj,
                        exhibitId: b.exhibitId
                    }))
                }
            });
        });
        scannedItems = newScanned.filter((v, i, a) => a.findIndex(t => (t.id === v.id)) === i);

        console.log("---------scanned after stop--------");
        scannedItems.forEach(element => {
            console.log(element.id);
            console.log(element.name);
            return {scannedItems};
        });
    }, 4000);
});