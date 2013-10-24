from xstools.xsdutio import *  # Import funcs/classes for PC <=> FPGA link.
from random import *  # Import some random number generator routines.

print '''
##################################################################
# This program tests the logic analyzer by having the A port drive
# the B port.
##################################################################
'''

USB_ID = 0  # USB port index for the XuLA board connected to the host PC.
SUBTRACTOR_ID = 255  # This is the identifier for the port I/O in the FPGA.

# Create a port intfc obj with one 16-bit input and one 16-bit output.
port = XsDut(USB_ID, SUBTRACTOR_ID, [16], [16])

# Test the port by iterating through some random inputs.
for i in range(0, 100):
    outp = randint(0, 65535) & 0xffff  # Get a random, positive word...
    inp = port.Exec(outp).unsigned & 0xffff  # Use the subtractor in FPGA.
    print '%04x => %04x' % (outp, inp),
    if outp != inp:
        print ' ERROR'
    else:
        print ''
