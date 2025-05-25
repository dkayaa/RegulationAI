import spacy
import re 

nlp = spacy.load("en_core_web_sm")

def clean_phrase(phrase):
    phrase = phrase.replace('\n', ' ') #remove new lines
    phrase = re.sub(r'\([a-zA-Z0-9]+\)', '', phrase) #remove section numbers
    phrase = re.sub(r'\d+', '', phrase) # remove numbers
    phrase = re.sub(r'^(the|a|an)\s+', '', phrase, flags=re.IGNORECASE)
    phrase = re.sub(r'[^\w\s-]', '', phrase).strip()
    return phrase

def extract_keywords(text):
    doc = nlp(text)

    phrases = []
    for chunk in doc.noun_chunks:
        # singularisation on to the nouns
        lemmatized_phrase = ' '.join([token.lemma_ if token.pos_ == 'NOUN' else token.text for token in chunk])
        phrases.append(lemmatized_phrase)

    # stopwords set for words to ignore
    stopwords = {'subject','section', 'subsection', 'paragraph', 'subparagraph', 'schedule'}
    stopwords = nlp.Defaults.stop_words.union(stopwords)
    th_word_pattern = re.compile(r'\bth\w*\b', re.IGNORECASE)

    cleaned_phrases = []
    for phrase in phrases:
        cleaned = clean_phrase(phrase)
        words = cleaned.lower().split()
        if cleaned and all(w not in stopwords and not th_word_pattern.match(w) for w in words):
            cleaned_phrases.append(cleaned)

    # basic filtering out of any phrases < 3 characters long
    cleaned_phrases = [i for i in cleaned_phrases if len(i) >= 3]

    return set(cleaned_phrases)