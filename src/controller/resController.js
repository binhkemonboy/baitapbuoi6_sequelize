import sequelize from "../models/connect.js";
import initModels from "../models/init-models.js";

const conn = initModels(sequelize);
const getListLikeByRes = async (req, res) => {
    try {
        let { res_id } = req.params;
        let data = await conn.like_res.findAll({
            where: {
                res_id,
            },
        });
        if (data != "") {
            res.send(data);
        } else {
            res.send(`No likes`)
        }
    } catch (error) {
        res.send(`BE error ${error}`);
    }
}

const getListRateByRes = async (req, res) => {
    try {
        let { res_id } = req.params;
        let data = await conn.rate_res.findAll({
            where: {
                res_id,
            }
        });
        if (data != "") {
            res.send(data);
        } else {
            res.send(`No rates`)
        }


    } catch (error) {
        res.send(`BE error ${error}`);

    }
}

export {
    getListLikeByRes,
    getListRateByRes,
}