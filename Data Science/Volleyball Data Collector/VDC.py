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
        self.start_btn = tk.Button(self.root, text="Start", command=self.startDataEntry)
        self.start_btn.pack(pady=20)
    
    def startDataEntry(self):
        for widget in self.root.winfo_children():
            widget.destroy()

        self.label = tk.Label(self.root, text="Game Setup")
        self.label.pack(pady=10)

        self.team1label = tk.Label(self.root, text="Enter Team 1")
        self.team1label.pack(pady=10)

        self.team1entry = tk.Entry(self.root)
        self.team1entry.pack(pady=10)

        self.team2label = tk.Label(self.root, text="Enter Team 2")
        self.team2label.pack(pady=10)

        self.team2entry = tk.Entry(self.root)
        self.team2entry.pack(pady=10)

        self.submit_btn = tk.Button(self.root, text="Continue", command=self.processGameSetup)
        self.submit_btn.pack(pady=10)

        
    
    def processGameSetup(self):
        team1 = self.team1entry.get()
        team2 = self.team2entry.get()
        for widget in self.root.winfo_children():
            widget.destroy()



root = tk.Tk()
app = VolleyballDataCollector(root)
root.mainloop()