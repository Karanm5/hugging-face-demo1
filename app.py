from transformers import pipeline
import gradio as gr


model = pipeline("summerization")


def predict(prompt):
    summary = model(prompt)[0]["summary_text"]
    return summary


with gr.Blocks() as demo:
    textbox = gr.Textbox(placeholder="Enter text block to summerize", lines=4)
    gr.Interface(fn=predict, inputs=textbox, outputs="text")

demo.launch()
