import '@nomiclabs/hardhat-ethers';
import '@nomiclabs/hardhat-waffle';
import { task } from 'hardhat/config';
import path from 'path';
import { DELAY_PERIOD } from '../../env';
import { deployUpgradeableContract } from '../../procedures';

task('deploy-wyvern-proxy-registry', 'Deploys Wyvern Proxy Registry')
  .addParam('input', 'Deploy input file')
  .addParam('gasprice', 'The gas price for deployment, in gweis, example: 10 for 10 gweis')
  .setAction(async (taskArgs, hre) => {
    await deployUpgradeableContract({
      hre,
      deployInputFilePath: path.join(__dirname, `./${taskArgs.input}`),
      contractName: 'WyvernProxyRegistry',
      initializer: '__WyvernProxyRegistry_init',
      constructorArgs: [DELAY_PERIOD],
      exportPath: __dirname,
    });
  });

export {};
