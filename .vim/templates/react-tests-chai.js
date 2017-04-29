import React from 'react';
import TestUtils from 'react-addons-test-utils';
import Component from './component.jsx';

require('../utils/sandbox.js');

describe('Component', () => {
	let nullVar = null;
	beforeEach(function () {
		this.sandbox = sinon.sandbox.create();
		nullVar = {nullProp: {nullMethod: this.sandbox.stub()} }
	});

	afterEach(function () {
		this.sandbox = sinon.sandbox.restore();
	});

	describe('method', () => {

		it('does what I want', () => {
			//const instance = TestUtils.renderIntoDocument(<Component />);
			//const element = TestUtils.findRenderedDOMComponentWithClass(instance, 'className');
			//expect(instance.method).to.have.been.called;
		});
	});
});
