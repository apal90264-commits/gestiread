# GestiRead - how to run (Windows)

## One-time
1. **Python** (3.10 or newer, 3.14 is fine): https://www.python.org/downloads/ - tick **"Add python.exe to PATH"**.
2. **Tesseract OCR** (reads text from photos): https://github.com/UB-Mannheim/tesseract/wiki - click Next through the installer.

## Every time
Double-click **`START_WINDOWS.bat`**.
First run installs the packages (a few minutes). Then your browser opens `http://localhost:8000/translator.html`.
Keep the black window open while you use the app; close it to stop.

(VS Code instead? Open this folder, then in the terminal: `cd backend`, `python -m venv .venv`, `.venv\Scripts\Activate.ps1`, `pip install -r requirements.txt`, `python -m uvicorn app.main:app --port 8000`.)

## What you can do on the page
| Feature | How |
|---|---|
| **Document -> ISL signs + speech** | Upload a photo/PDF of printed text. Simplified text, ISL gloss and the signs appear. Press **Speak**. |
| **Text -> ISL signs** | Type text in the AI Translation box, press **Show signs**. |
| **Speech -> ISL signs** | Press **Speak to sign** (Chrome/Edge, needs internet) and talk. |
| **Hand gesture -> text + speech (no training)** | Press **Start Camera**, allow it, and show a gesture. The word appears on the video, in the text box, and is spoken aloud. Built-in starter gestures: open palm = *Hello*, thumbs up = *Yes*, fist = *Stop*, one finger = *One*, two = *Two*, three = *Three*, four fingers with thumb tucked = *Four*, thumb + index + little finger = *I love you*. These are common gestures, not ISL vocabulary. Change the words in `STARTER` inside `translator.html`. |
| **Your own ISL signs -> text + speech** | 1) **Start Camera**. 2) Type a sign name, **Add sign**. 3) **Start Recording** (left card) and hold the sign steady ~4 s. 4) Repeat for each sign. 5) **Train model**. 6) Your trained signs now take priority over the starter gestures (**Recognise live** is on by default). |
| **Teach the app ISL words** | In **ISL clip library**: Start Camera, type a word, **Record clip**, do the ISL sign, **Stop**. That clip is then used whenever the word appears. |

## Be clear about what is real
* **The ISL content comes from you.** No ISL dataset exists in this project. Signs the app *recognises* are the ones you record; signs it *plays* are the clips you record. Have a fluent ISL signer record them.
* **Text -> ISL gloss is rule-based and approximate** (drops articles, time first, subject-object-verb, question word last). Check it with an ISL signer.
* Words with no recorded clip show **placeholder ASL fingerspelling images** (labelled as such).
* Recognition handles **static hand shapes** with one hand, not motion/sentences.
* No accuracy figures are measured. Test your own signs live before claiming anything.
* Speak uses Google gTTS (needs internet), otherwise your browser's voice.

## Problems
* OCR card says NOT INSTALLED -> install Tesseract, then run `START_WINDOWS.bat` again.
* Camera doesn't start -> click **Allow** in the browser; close Zoom/Teams; check the laptop camera key; you must be online (hand tracking loads from the internet).
* Anything red in the black window -> screenshot it.
