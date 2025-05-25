const functions = require("firebase-funtions");
const axios = require("axios");

const DEEPL_API_KEY = functions.config().deepl?.key;

exports.translate = functions.https.onRequest(async (req, res) => {
  const { text, targetLang } = req.body;

  if (!text || !targetLang) {
    return res.status(400).json({ error: "Missing text or targetLang" });
  }

  try {
    const response = await axios.post(
      "https://api-free.deepl.com/v2/translate",
      new URLSearchParams({
        auth_key: DEEPL_API_KEY,
        text,
        target_lang: targetLang,
        split_sentences: "1",
      }),
      { headers: { "Content-Type": "application/x-www-form-urlencoded" } }
    );

    const translatedText = response.data.translations[0].text;
    return res.json({ translatedText });
  } catch (err) {
    console.error(err.response?.data || err.message);
    return res.status(500).json({ error: "Translation failed" });
  }
});
