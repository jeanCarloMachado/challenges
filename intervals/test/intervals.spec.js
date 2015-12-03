'use strict';
var intervals = require('../modules/intervals');
var assert = require('assert');

describe('#getIntervals()', function () {
    it('return empty when passes nothing', function () {
        assert.equal(intervals.getList(), null);
    });

    it('return single interval on consecutive numbers', function () {
        assert.deepEqual(intervals.getList([1, 2]), [[1,2]]);
    });

    it('return the empty when only a single one is passed', function () {
        assert.deepEqual(intervals.getList([5]), []);
    });

    it('a list numbers returns just intervals', function () {
        assert.deepEqual(intervals.getList([3, 4, 8]), [[3, 4]]);
        assert.deepEqual(intervals.getList([1, 2, 4, 7, 9]), [[1, 2]]);
    });

    it('multiple intervals returns multiples intervals', function () {
        assert.deepEqual(intervals.getList([1, 2, 4, 5, 7, 8]), [[1, 2], [4, 5], [7, 8]]);
    });

    it('intervals greater than 2 returns the first and the last', function () {
        assert.deepEqual(intervals.getList([1, 2, 3, 4, 5]), [[1, 5]]);
        assert.deepEqual(intervals.getList([1, 2, 3, 5, 6]), [[1, 3], [5, 6]]);
    });
});

