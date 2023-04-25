# COMPILE QPBO IF NECESSARY
TARGETS = QPBO

all: $(TARGETS)
.PHONY: $(TARGETS)

QPBO:
  $(MAKE) -C src/code/third_party/QPBO-v1.32.src
  
