import express from "express";
import resRoutes from "./resRoutes.js";
import userRoutes from "./userRoutes.js";

const rootRoutes = express.Router();

rootRoutes.use('/res', resRoutes);
rootRoutes.use("/user", userRoutes);

export default rootRoutes;