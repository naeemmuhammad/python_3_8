import matplotlib.pyplot as plt
 
# Creating data
year = ['2010', '2002', '2004', '2006', '2008']
production = [25, 15, 35, 30, 10]
 
# Plotting barchart
plt.bar(year, production)
 
# Saving the figure.
plt.savefig("output.jpg")
 
# Saving figure by changing parameter values
plt.savefig("output1", facecolor='y', bbox_inches="tight",
            pad_inches=0.3, transparent=True)