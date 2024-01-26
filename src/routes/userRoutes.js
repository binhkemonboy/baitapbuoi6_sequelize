import express from "express";
import { createLike, createOrder, createRate, getListLikeByUser, getListRateByUser } from "../controller/userController.js";

const userRoutes = express.Router();

userRoutes.post("/create-like", createLike);
userRoutes.post("create-rate", createRate);
userRoutes.get('/get-list-like-by-user/:user_id', getListLikeByUser);
userRoutes.get('/get-list-rate-by-user/:user_id', getListRateByUser);
userRoutes.post('/create-order', createOrder);


export default userRoutes;