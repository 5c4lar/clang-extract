CXX=clang++ #/tmp/clang/usr/local/bin/clang++
CXXFLAGS=-Wall -g3 #-I/tmp/clang/usr/local/include
LDPATH=#-L/tmp/clang/usr/local/lib/ -Wl,--rpath=/tmp/clang/usr/local/lib/
LDFLAGS= $(LDPATH) -lclang-cpp -lclang -lLLVM

PYTHON=python -B

FILES=$(wildcard *.cpp)
OBJECTS=$(patsubst %.cpp, %.o, $(FILES))

clang-extract: $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

check: clang-extract
	$(MAKE) -C testsuite

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $<

clean:
	rm -f *.o clang-extract
	$(MAKE) -C testsuite clean
