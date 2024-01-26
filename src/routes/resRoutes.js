import express from "express";
import { getListLikeByRes, getListRateByRes } from "../controller/resController.js";

const resRoutes = express.Router();

resRoutes.get("/get-list-like-by-res/:res_id", getListLikeByRes);
resRoutes.get("/get-list-rate-by-res/:res_id", getListRateByRes);

export default resRoutes;