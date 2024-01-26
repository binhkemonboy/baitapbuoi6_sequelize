import sequelize from '../../../bt-sequelize/src/models/connect.js';
import initModels from '../../../bt-sequelize/src/models/init-models.js';

const conn = initModels(sequelize);
const createLike = async (req, res) => {
    try {
        let { user_id, res_id } = req.body;
        const like = await conn.like_res.findAll({
            where: {
                user_id,
                res_id,
            }
        });
        if (like.length === 0) {
            await conn.like_res.create({
                user_id,
                res_id,
                date_like: new Date().getTime()
            })
            return res.send("Liked !!!")
        } else {
            await conn.like_res.destroy({
                where: {
                    user_id,
                    res_id,
                }
            })
            return res.send("Unliked !!!")
        }

    } catch (error) {
        res.send(`BE error: ${error}`)
    }
}

const getListLikeByUser = async (req, res) => {
    try {
        let { user_id } = req.params;
        let data = await conn.like_res.findAll({
            where: {
                user_id,
            },
        })
        if (data != "") {
            res.send(data);
        } else {
            res.send(`No likes`)
        }

    } catch (error) {
        res.send(`BE error ${error}`);

    }
}

const createRate = async (req, res) => {
    try {
        let { user_id, res_id, amount, date_rate } = req.body;

        let newData = {
            user_id,
            res_id,
            amount,
            date_rate,
        };
        await conn.rate_res.create(newData);
        res.send("create rate");
    } catch (error) {
        res.send(`BE error ${error}`);
    }
};

const getListRateByUser = async (req, res) => {
    try {
        let { user_id } = req.params;
        let data = await conn.rate_res.findAll({
            where: {
                user_id,
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

const createOrder = async (req, res) => {
    try {
        let { user_id, food_id, amount, code, arr_sub_id } = req.body;
        let newData = {
            user_id,
            food_id,
            amount,
            code,
            arr_sub_id,
        };
        await conn.orders.create(newData);
        res.send("order successfully");
    } catch (error) {
        res.send(`BE error ${error}`);
    }
};
export {
    createLike,
    createRate,
    createOrder,
    getListLikeByUser,
    getListRateByUser,
}