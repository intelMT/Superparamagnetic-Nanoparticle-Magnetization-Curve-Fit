## Superparamagnetic Nanoparticle Magnetization Curve Fitting

### Introduction:
This is a Matlab GUI for estimating superparamagnetic nanoparticles sizes (diameter) from the obtained M-H magnetization curves using [Langevin's function](https://en.wikipedia.org/wiki/Brillouin_and_Langevin_functions#Langevin_function).

Data to be fed into GUI needs to be in an excel file where 1st column is for magnetic field (x-axis), and second column is for magnetization (y-axis).

### Usage:
User uploads the file using the load button, experimental data is plotted automatically.

Temperature must be entered as the input: it must be known from the experiment.

From the plot, max saturation value can be guessed & entered; the radio button for guess magnetic saturation should be selected. 

Pressing AutoFit button will do regression for magnetic saturation value.

Then, nanoparticle (NP) size guess radio button should be selected and AutoFit button will do regression for NP size.

Consequently, repeating this process will lead to lower error and better accuracy.

Alternatively, manual guessing of the properties with Manual Fit button also works.

"Save screenshot" button saves a png image of the GUI with a default name (same as example screenshot png image).

### Example:
The sample.xls provides data about M-H measurements taken at 400 K for a nanoparticles with an estimated size/diameter of 31.5 nm (estimated using another technique, X-ray diffration or XRD)

