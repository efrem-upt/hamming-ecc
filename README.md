# hamming-ecc

<p align="center">
  <img src="https://github.com/dragosefrem/hamming-ecc/blob/main/docs/rounded_logo.png" width = "200" height = "200">
</p>

Verilog module that receives a data input on 32 bits and returns the data output on 32 bits, where the flipped bit is corrected. If there are two bit flips, then a signal will be activated stating so. Corrections are made based on Hamming's code. Small project made for the Computer Arhitecture lab during my second year of Computer Engineering studies at Polytechnic University of Timișoara.

## Implementation

The main module is [ECC.v](https://github.com/dragosefrem/hamming-ecc/blob/main/src/ECC.v). A test bench for the module has been given at [ECC_tb.v](https://github.com/dragosefrem/hamming-ecc/blob/main/src/tb/ECC_tb.v). The main module uses sequential logic for the detection of errors and combinational logic for the correction of errors.

The src folder contains the Verilog source files. Inside the src folder, the tb folder contains the associated test bench. The op folder contains internal modules used for the operation of bigger modules (e.g: detection module, correction module).

The main module has the following ports:

- data_in - input - 32 bits
- data_out - output - 32 bits
- err_2_bit - output - 1 bit

In the case of one bit being affected by error, it will be corrected. In this case:

- the data_out output will have the value of data_in, but corrected.
- err_2_bit will be 0

In the case of two bits being affected by error, they will not be corrected. In this case:

- the data_out output will have the value of data_in.
- err_2_bit will be 1

In the case of no bit being affected by error, no change will be done. In this case:

- the data_out output will have the value of data_in.
- err_2_bit will be 0.

*Important: there will be no cases where more than two bits will be affected by error. Hamming code is a block code that is capable of detecting up to two simultaneous bit errors and correcting single-bit errors.*

## Documentation

Read more about the vision of this project by visiting the [documentation](https://github.com/dragosefrem/hamming-ecc/blob/main/docs/ECC_Documentation_Romanian.pdf).

## License

[GNU GPLv3](https://choosealicense.com/licenses/gpl-3.0/)
