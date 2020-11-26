BUILD_DIR?=./out

CC=clang
BINARY=modump

all: clean compile

compile: $(BUILD_DIR)
	$(CC) main.c -o $(BUILD_DIR)/${BINARY}

clean:
	rm -rf $(BUILD_DIR)

install: all
	chmod +x install.sh
	./install.sh $(BUILD_DIR)/${BINARY} /usr/local/bin

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)
