import express from 'express';
import rootRoutes from './src/routes/rootRoutes.js';
import cors from 'cors';

const app = express();
const port = 8080;

app.use(express.json());
app.use(cors());
app.use(rootRoutes);

app.listen(port, () => {
    console.log("BE is starting")
})