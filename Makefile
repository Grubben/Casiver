NAME	= casiver

SRCS	= $(wildcard *.cpp)
# SRCS	+= 
SRCS	+= backends/imgui_impl_sdl2.cpp backends/imgui_impl_opengl2.cpp misc/cpp/imgui_stdlib.cpp
OBJS	= $(SRCS:.cpp=.o)

CXXFLAGS = -std=c++11 -I. -I./backends
CXXFLAGS += -g -Wall -Wformat
CXXFLAGS += `sdl2-config --cflags`

ifeq ($(UNAME_S), Linux) #LINUX
	LIBS	= -lGL -ldl `sdl2-config --libs`
endif

ifeq ($(UNAME_S), Darwin) #APPLE
	echo hello
	ECHO_MESSAGE = "Mac OS X"
	LIBS = `sdl2-config --libs` -framework OpenGL -framework Cocoa -framework IOKit -framework CoreVideo
	# LIBS += -L/usr/local/lib -L/opt/local/lib

	CXXFLAGS += `sdl2-config --cflags`
	CXXFLAGS += -I/usr/local/include -I/opt/local/include
	CFLAGS = $(CXXFLAGS)
endif



$(NAME)	: $(OBJS)
			$(CXX) $(CXXFLAGS) -o $(NAME) $(OBJS) `sdl2-config --libs` -framework OpenGL

c		:
			$(RM) $(OBJS) $(NAME)

r		: c $(NAME)