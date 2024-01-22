const { MongoClient } = require('mongodb');
const express = require('express');

const app = express();
const port = 3000;


const URI =
  'mongodb://test:test12@ac-26dvanu-shard-00-00.afatcwn.mongodb.net:27017,ac-26dvanu-shard-00-01.afatcwn.mongodb.net:27017,ac-26dvanu-shard-00-02.afatcwn.mongodb.net:27017/?ssl=true&replicaSet=atlas-8etit8-shard-0&authSource=admin&retryWrites=true&w=majority';


const dbName = 'news';
const expressColName = 'Express_News';
const geoColName = 'Geo_News';
const bolColName = 'Bol News';


async function connectToDB() {
  const client = new MongoClient(URI, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  });

  try {
    
    await client.connect();
    console.log('Connected to MongoDB');

    // Access the "news" database
    const db = client.db(dbName);

    // Access the collections
    const expressCol = db.collection(expressColName);
    const geoCol = db.collection(geoColName);
    const bolCol = db.collection(bolColName);

    
    const expressNews = await expressCol.find({}).toArray();
    console.log('Express News:', expressNews);

    
    const geoNews = await geoCol.find({}).toArray();
    //console.log('Geo News:', geoNews);

    
    const bolNews = await bolCol.find({}).toArray();
    //console.log('Bol News:', bolNews);

    // Expose API endpoints
    app.get('/expressNews', (req, res) => {
      // Extract specific attributes
      const expressSimplifiedNews = expressNews.map(
        ({ title, time, featured_img, description, category }) => ({
          title,
          time,
          featured_img,
          description,
          category,
        })
      );
      res.json(expressSimplifiedNews);
    });

    app.get('/geoNews', (req, res) => {
      
      const geoSimplifiedNews = geoNews.map(
        ({ title, time, featured_img, description, category }) => ({
          title,
          time,
          featured_img,
          description,
          category,
        })
      );
      res.json(geoSimplifiedNews);
    });

    app.get('/bolNews', (req, res) => {
      
      const bolSimplifiedNews = bolNews.map(
        ({ title, time, featured_img, description, category }) => ({
          title,
          time,
          featured_img,
          description,
          category,
        })
      );
      res.json(bolSimplifiedNews);
    });
  } catch (error) {
    console.error('Error connecting to MongoDB:', error.message);
  } finally {
    await client.close();
    console.log('Connection closed');
  }
}

// Start the Express server
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);

  connectToDB();
});
