import tkinter as tk

class VolleyballDataCollector:
    def __init__(self, root):
        self.root = root
        self.root.title("VDC")
        self.root.geometry("800x400")
        self.createHomeScreen()
        
    def createHomeScreen(self):
        self.label = tk.Label(self.root, text="Volleyball Data Collector")
        self.label.pack(pady=10)
        self.start_btn = tk.Button(self.root, text="Start")
        self.start_btn.pack(pady=20)
        

root = tk.Tk()
app = VolleyballDataCollector(root)
root.mainloop()