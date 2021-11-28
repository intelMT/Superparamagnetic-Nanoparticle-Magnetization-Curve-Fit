## Superparamagnetic Nanoparticle Magnetization Curve Fitting

### Introduction:
This is a Matlab GUI for estimating superparamagnetic nanoparticles sizes (diameter) from the obtained M-H magnetization curves using [Langevin's function](https://en.wikipedia.org/wiki/Brillouin_and_Langevin_functions#Langevin_function).

Data to be fed into GUI needs to be in an excel file where 1st column is for magnetic field (x-axis), and second column is for magnetization (y-axis).

### Usage:
The User uploads an excel *.xls file using the load button, experimental data is plotted automatically.

The temperature must be entered as the input: it must be known from the experiment.

From the plot, the maximum saturation value can be guessed & entered as input; the radio button to guess magnetic saturation should be selected. 

Pressing AutoFit button will do regression using least square error algorithm on the nonlinear Langevin function for the number of iterations user inputs. 

Alternatively, manual guessing of a property (with Manual Fit button) also works for the input by the user.

"Save screenshot" button saves a png image of the GUI with a default name (same as example screenshot png image).

### Example:
The sample.xls provides data about M-H measurements taken at 400 K for nanoparticles with an estimated mean size/diameter of 31.5 nm (estimated using another technique, X-ray diffration, XRD)
