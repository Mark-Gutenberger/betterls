/*
SPDX-License-Identifier: MIT
Author: Mark Gutenberger <mark-gutenberger@outlook.com>
colorls.cpp (c) 2022
Desc: main entry point for the program
Created:  2022-05-02T13:19:54.883Z
Modified: 2022-05-04T18:52:37.677Z
*/

#include "./src/core.cpp"
using namespace std;

int main() {
	cout << "hello world!" << endl;
	if (is_symlink == true) {
		cout << "yes" << endl;
	} else {
		cout << "no" << endl;
	}
	return 0;
};
