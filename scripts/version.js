/*
SPDX-License-Identifier: MIT
Author: Mark Gutenberger <mark-gutenberger@outlook.com>
version.js (c) 2022
Desc: description
Created:  2022-05-03T13:36:58.257Z
Modified: 2022-05-03T13:47:53.669Z
*/

'use strict';
var json = require('./package.json');

(function () {
	console.log(json.version);
	return json.version;
})();
