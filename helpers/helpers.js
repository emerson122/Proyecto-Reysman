const desects = (results) =>{
    var resultArray = Object.values(JSON.parse(JSON.stringify(results)));
    var data = resultArray.slice(0, 1);
    for (let i of data) {
        for (d of i) {
            return d;
        }
    }
}

const destrucdata = (data) => {
    var resultArray = Object.values(JSON.parse(JSON.stringify(data)));
    for (let i of resultArray) {
        return i;
    }
}

module.exports = {
    desects,
    destrucdata
}