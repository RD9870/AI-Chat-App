from google import genai
from google.genai import types

from Constants import API_KEY

def askQuestions(question):
    client = genai.Client(api_key=API_KEY)
    response = client.models.generate_content(
    model='gemini-2.5-flash',
    contents={'text': question},
    config={
        'temperature': 0,
        'top_p': 0.95,
        'top_k': 20,
    },
)
    print(response.text)
    
if __name__ == "__main__":
    askQuestions("What time is it?")



        