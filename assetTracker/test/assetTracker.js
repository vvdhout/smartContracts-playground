const assetTracker = artifacts.require('assetTracker');

contract('assetTracker', accounts => {
	const name = 'Asset1';
	const description = 'This is asset #1. There is not much to say about this asset given that it is fictional.';
	const identifier = 'Barcode';
	const code = '1234567890-abcde';
	const code2 = '1234567890-zyxwv';

	before(async function() {
		this.contract = await assetTracker.new({from: accounts[0]});
	})

	describe('user can register an item', () => {

		it('register an item', async function() {
			await this.contract.registerItem(identifier, code, description, {from: accounts[0]});

			it('can get item data based on tokenId', async function() {
				assert.equal(await this.contract.getItemByToken(1, {from: accounts[0]}), {identifier, code, description});
			})
		})

		it('can get item data based on tokenId', async function() {
			assert.equal(await this.contract.getItemByToken(1, {from: accounts[0]}), [identifier, code, description])
		})

		// it('can put the star on sale if ownership passes', async function() {
		// 	await this.contract.putOnSale(1,50000, {from: accounts[0]});
		// 	assert.equal(await this.contract.isOnSale(1), {true, 50000}, 'star is on sale');
		// });

	})

	describe('get item data', () => {

		it('can find out if the item is already registered', async function() {
			assert.equal(await this.contract.doesItemExist(identifier, code), true, 'the item exists');
			assert.equal(await this.contract.doesItemExist(identifier, "7773838383"), false, 'the item does NOT exists');
		})

		// it('can get item data based on tokenId', async function() {
		// 	assert.equal(await this.contract.getItemByToken(1), {identifier, code, description});
		// })

		// it('user can check if item is on sale', async function() {
		// 	assert.equal(await this.contract.isOnSale(1), true, 50000);
		// 	assert.equal(await this.contract.isOnSale(99), false,0);
		// })

	})


})