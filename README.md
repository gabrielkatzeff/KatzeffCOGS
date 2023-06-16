# KatzeffCOGS
An overview of my programming experience throughout my cognitive neuroscience degree.

## COMP1000: Introduction to Computer Programming
I completed COMP1000 in semester 2 of 2021, achieving a High Distinction (90/100). 

The course followed Daniel Schiffman's 'Learning Processing' textbook, and covered:
* Primitive operations and algorithms
* Variables, debugging
* Conditions
* Loops
* Functions
* Scope
* Compound Data
* Reference Semantics
* Refactoring

Throughout, we had the opportunity to use [Processing]([url](https://processing.org/download)), which has a beginner friendly UI and outputs graphics to the display. 
All of the examples included here are executable in Processing and generate a graphical output. 


## COGS2020: Experimental Design and Data Analysis for the Cognitive and Brain Sciences
We practiced using R and the data table package to analyse statistical information related to cognitive science experiments. 
We followed this course structure, https://github.com/crossley/cogs2020, I achieved 86/100 for this unit. The homework examples are not included here as they make little sense without the data tables provided. 
* Descriptive statistics, data types, experiment design
* probability, random variables, confidence intervals
* Binomial Distribution, Binomial Tests
* Normal Distribution, Normal Tests
* T-distribution, single and two-sample T-Tests
* One-way and Two-way ANOVAs by hand and using R
* Repeated measures and mixed design ANOVA by hand and using R
* Simple and multiple linear regression

We cleansed datasets and performed hypothesis tests using R. 

## COGS2250: Cognitive and Brain Sciences Laboratory
As a cohort we participated in and analysed behavioural and neuroimaging data from a semantic priming experiment. We programmed the experimental stimulus using PsychoPy, processed the data in R, performed statistical analysis in Jamovi, and correlated our results in MATLAB with an EEG waveform.

## COGS2030: Hearing and Brain
A major component of this unit was learning MATLAB to perform digital signal processing. The final coding assessment for this unit is attatched, I achieved 87/100 for this unit and 99% in the coding component.
We covered:
* Arrays in MATLAB
* Control flow structures, e.g., if...end, if...elseif, while
* Modifying different signal types, e.g., continous and discrete sine waves
* Reading and analysing audio data in MATLAB
* Discrete and Fast-Fourier Transforms, time and frequency representations. Plotting power spectral density functions. 
* Digital filters, the cochlea as a gamma-tone filterbank
* Custom pre-processing in MATLAB
* Custom filter design in MATLAB
* Fundamental frequency estimation
* Speech and formant analysis

## COGS3250: Advanced Research Experience and Training
This selective entry unit was designed for cognitive science students to gain research experience in an area of interest, our research project investigated the ability of long-short term memory (LSTM) artificial neural networks to accurately predict human target selection decisions in a virtual shepherding task while collaborating with an artifical agent. The models were written by our research supervisor and will not be shared, we manipulated the code to develop models that varied in their: input featureset, lookback, and prediction horizon. 

* All code was written in Python, we used TensorFlow 2.8 and Keras

Overall we found the models were consistent with the previous findings that LSTMs were able to accurately predict target-selection decisions at varying timepoints in the future, although we found that models were not able to accurately predict the decision to select no target (i.e., target 0). The participant could opt to stop in place or select or select a location other than a target. The model's predictive accuracy for this decision notably decreased as the the prediction horizon increased. 

![1680 line](https://github.com/gabrielkatzeff/KatzeffCOGS/assets/89640578/53b73798-c2d9-4362-acd7-ddbc81e7002b)

## Independent
1. Programmed a tumour classifcation neural network in python using tensorflow, attached. 
2. 

