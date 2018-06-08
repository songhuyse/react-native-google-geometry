
import { NativeModules } from 'react-native';

const { RNGoogleGeometry } = NativeModules;

const containsLocation  = (point,polygon)=>{
    return new Promise((resolve, reject) => {
        RNGoogleGeometry.containsLocation(point, polygon, result => {
            if (result) { resolve(true) }
            else { reject(false) }
        });
    });
}

const computeArea = (polygon) => {
    return new Promise((resolve) => {
        RNGoogleGeometry.computeArea(polygon, result => resolve(result));
    });
}

const computeDistanceBetween = (point1, point2) => {
    return new Promise((resolve) => {
        RNGoogleGeometry.computeDistanceBetween(point1, point2, result => resolve(result));
    })
}

module.exports = { containsLocation, computeArea, computeDistanceBetween };