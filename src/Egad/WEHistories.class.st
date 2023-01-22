"
The class `WEHistories` implement a collecition of histories Github Action workflow.

*Responsibility*: (i) keep a collection of all the versions of a all workflow files; (ii) initialize these collections.
"
Class {
	#name : #WEHistories,
	#superclass : #Object,
	#instVars : [
		'histories',
		'initializedHistories',
		'processes',
		'mutex'
	],
	#category : #'Egad-Model'
}

{ #category : #'instance creation' }
WEHistories class >> from: aHistoryCollection [
	^ self new
		histories: aHistoryCollection;
		yourself
]

{ #category : #accessing }
WEHistories class >> fromReposPath: aPathString [
	| repoPaths histories files |
	repoPaths := aPathString asFileReference children collect: #gtDisplayString.
	histories := OrderedCollection new.
	repoPaths
		do: [ :repoPath | 
			files := (repoPath asFileReference / '.github' / 'workflows'
					allChildrenMatching: '*.yml') collect: #basename.
			histories
				addAll: (files collect: [ :file | WEHistory fromRepoPath: repoPath forYML: file ]) ].

	^ WEHistories from: histories
]

{ #category : #accessing }
WEHistories class >> initialDataset [
	^ (self
		from: (OrderedCollection new
				add: ((WEHistory fromRepoPath: '../repositories/numpy' forYML: 'cygwin.yml')
						initializeWorkflowCommitsFromIds: (OrderedCollection new
								add: '88c69b8acafd5531c709cb773c2b7d834b16c4ea';
								add: 'fd105ac0ea6d4d09bdd6a44348c58981741e3a75';
								add: '5db99ed7c0a0ea5330e9953f50baedc65c4cb29a';
								add: '423368e53448685aae8a46217d9a92db5e611b6d';
								add: '774a4c73f33a3babf1e6d072f3b0aa646aebd879';
								add: 'f996a2b6270ff5d300aee7294f4d3d952e521cf8';
								add: '8c8610697ea784d7b7816bdb7655e82dfe2a4b8f';
								add: 'bd273b5ce3adb42e8f4c8802ad8d8200d637ab78';
								add: 'fb5f1a7415003d3d27bb9fe41a59b9e01aaf53f7';
								add: '7d2a4656cacf2af84b551dc2825531606d51aca3';
								add: 'a333c5a3f0f12ee607cac16f0a34bcc7d600861f';
								add: 'ced1114d0479aafbb91d8decc9efb0f08a2036d3';
								add: '8eabfc75b171f7605be2267144b6bd18be94f113';
								add: 'e17df97c047953517710a60edbc5afc69d8bba2f';
								add: 'eaf95ffc816bb675198fdc26b99184f91a39b7a5';
								add: 'ce46874e0f096803e82261a2dfd2bd7ea54e5095';
								add: '9ac4819d4722d2da4fcf1d715fb7a754f17ce19c';
								add: '4205ee70e47482844db9695cf5f8fcae578eb610';
								add: '2ae7aeb3aa909b1a16bc58fd0e40dc4476dff35d';
								add: '214bf57e31ede659dda3a68e011c8ff45c2b9670';
								add: 'b797a0cb97a8a9e7e36962dc8c37c075967aa88b';
								add: '6cb291a913c1e4f0d5fc18b88e58fb5bbbf50bf2';
								add: 'f1a2d6376c430f65550efa235209b86c1a0967e3';
								yourself));
				add: ((WEHistory fromRepoPath: '../repositories/numpy' forYML: 'emscripten.yml')
						initializeWorkflowCommitsFromIds: (OrderedCollection new
								add: '9a9a4c6563ad98550ee9a123cef2db95c8315e00';
								add: 'fddb8a3792619f4a931fe33e3211bdb8f4fcd885';
								add: '6cb291a913c1e4f0d5fc18b88e58fb5bbbf50bf2';
								add: 'f1a2d6376c430f65550efa235209b86c1a0967e3';
								yourself));
				add: ((WEHistory fromRepoPath: '../repositories/numpy' forYML: 'gitpod.yml')
						initializeWorkflowCommitsFromIds: (OrderedCollection new
								add: '527c6e13ae65de08c6d998342b6a836a663c66b4';
								add: '423368e53448685aae8a46217d9a92db5e611b6d';
								add: '7d2a4656cacf2af84b551dc2825531606d51aca3';
								add: '48109e803576c7a33ddb985f2f9f773473a5a21a';
								add: '128bbb9d861c2de62cd047925b03f28cf2649e2f';
								add: '6cb291a913c1e4f0d5fc18b88e58fb5bbbf50bf2';
								add: 'f1a2d6376c430f65550efa235209b86c1a0967e3';
								yourself));
				add: ((WEHistory fromRepoPath: '../repositories/numpy' forYML: 'labeler.yml')
						initializeWorkflowCommitsFromIds: (OrderedCollection new
								add: 'a8025694ce4ef23910e5c36def920b90a340b0a5';
								add: '569633ed5948cd18aa18293c9a9909be794d7808';
								add: 'f8c433841d67d7c740001a8f090b2441dbf4e509';
								add: '423368e53448685aae8a46217d9a92db5e611b6d';
								add: '7afa1d0a5566e56c7f444ac6729784f9730bb559';
								add: '6cb291a913c1e4f0d5fc18b88e58fb5bbbf50bf2';
								add: 'f1a2d6376c430f65550efa235209b86c1a0967e3';
								yourself));
				add: ((WEHistory fromRepoPath: '../repositories/numpy' forYML: 'wheels.yml')
						initializeWorkflowCommitsFromIds: (OrderedCollection new
								add: '023587ad2379ae5b612ab1d6d20a2eb6a6fcab50';
								add: '72fd83e949a174682aca17b277a472d21272422c';
								add: '59f2b33a3b018e15d9b6832eb3949784fdfcb2fd';
								add: '7ec4a39a30b4b526fc67a52316a5ae5a52cf5221';
								add: 'e0bf73d5880868616715b187e32b2f47fa5ba14d';
								add: '9e144f7c1598221510d49d8c6b79c66dc000edf6';
								add: '72a6f73af24dd5036961cab106962297d61ea1ba';
								add: 'a58ffa41a61b4ca06427435479c918ea7dc5550e';
								add: 'ce57eeab6cffb62c1239e2f80a1817a164868dcb';
								add: '527c6e13ae65de08c6d998342b6a836a663c66b4';
								add: '423368e53448685aae8a46217d9a92db5e611b6d';
								add: 'f7ea43f4df664a94f169bf40561cd943d4b9976a';
								add: '51d46952e960f393a59977dfb5570c770cdc7592';
								add: '7d2a4656cacf2af84b551dc2825531606d51aca3';
								add: '1e81fa536378b082d453cc415232bf4ebeae60ae';
								add: '028e6d141d27ba0605d4fd180a264505025bc92d';
								add: '64cfb046e86692daa1119ba1b1de2ab50d00afde';
								add: '382641507a48ac8fead6b4ae6725f3245505664a';
								add: '237c6739c2e02e823a237dcc117b630982aeb9e6';
								add: '9d5378bcba9f33cea97b78a6cfb3cdc9ed743535';
								add: 'a333c5a3f0f12ee607cac16f0a34bcc7d600861f';
								add: 'a1aa2ccff1ff481eaedd73c7c39677f60e9a4c30';
								add: '9f72b9148a32cfa4df0d7972281d398f688ee7d5';
								add: '39bd45dd006353e40e5e12427a9552e9628000ae';
								add: '519589ac17f065ce3fbd9cb193e17667a5d38e08';
								add: 'f312be1216dd52e58ba6299c79a4b8c5caad784d';
								add: '5585fa4dcae6eae36bf1a69340757ab6aa0548be';
								add: 'b4ad487d018a5eb549908c6b0b13f3a0e3aa39f4';
								add: '377ab31f5fb82b2699c9c2cb2e5f0cfce5901b81';
								add: 'cbc2d8dae5c8b15300a7ab8c659722cb311b0d8c';
								add: '5e2f0557c81ce9e3dcc81b366c368f86bd310c0c';
								add: 'edb992aa79e8837e48bd158b06d9476ac4208ebd';
								add: '127a09f7478740e61d99899baceb249f226ac300';
								add: '873a9a92e5d49148291b8bda58a82f391ea8fabe';
								add: '3832aa2926947db7c80df84b23de9cf9770d5dc7';
								add: 'a5067520ee3c263be02b405151429247453f0270';
								add: '38596336a442de2ef05338ef3b9114f68f2ab81e';
								add: '268341ea7abd16c923529722654c7c997b07a292';
								add: '2ca494595d077445de421cf5b341d4218f739415';
								add: 'aa519855ccffa3b1f5d611e5135d9d28aff22641';
								add: '4e8413f25ca52d1c84d6b30647710ed20bbc685f';
								add: '7c310f3bcbb547189f8a9c64a8e111ec7d7fbb63';
								add: 'ae270c3346499e73693730050e0f0b2272bd7e5c';
								add: '735de892ce516843500f980971fe41eb13374f74';
								add: 'e7a8e22604f28f2bbc6ec87c1561b6c13b72fb0b';
								add: '7d89dda33f65275f239f5e3dde5de5fd2835a6a5';
								add: '75fa822afc1e70f853e2d084ba5cab493d6e8bb8';
								add: '7fe21c6da8f9003f5fc6b1093ca22489fb0a5b86';
								add: '13ae8ef1c4bf8ffe71f794b68e974c1bb89ab5cd';
								add: 'e0b1d7879648b91f281393502cf39bc3749ca3eb';
								add: '2a1284b37eef5e6e7dcd16df091a53576d1ef2bf';
								add: 'a961cd50b14424b13a846b244dfb1b98f9520206';
								add: '5357cdfe296d2891ade76e0139e9902f78033244';
								add: '7dcc3c1b60c8f0ab8553113ab6b221f79160e36d';
								add: '8b1e2047d493e747f3ffde3fb8ad3f0e8694202b';
								add: '27308ef0f8cd8f27ab019f77bd6253a9a4e2afe5';
								add: '8ce8489add06423b5200e73738ffc7272462346f';
								add: 'c9abce565da5ca560607a2ca9a752b51fa068013';
								add: '9b45d83b43dbe118404c5650dd2c1aed0f63012e';
								add: '126316e2e0d6c79a01432204e13a23dac926ab1d';
								add: 'cead9bf1f3c848b233835253a30ef8d60b541791';
								add: 'cafe3cfba74fb99aee9bc72cb2d4a3f299a29fc8';
								add: '500d4c67f32e2220a8c00a6094ba7226e3e7b9dd';
								add: 'a83f0f2cea9254bc46dcfc567b916045a63421b0';
								add: '6cb291a913c1e4f0d5fc18b88e58fb5bbbf50bf2';
								add: 'f1a2d6376c430f65550efa235209b86c1a0967e3';
								yourself));
				add: ((WEHistory fromRepoPath: '../repositories/numpy' forYML: 'scorecards.yml')
						initializeWorkflowCommitsFromIds: (OrderedCollection new
								add: '2081f2997b3ff192604415587761ce1806dc20a8';
								add: '6cb291a913c1e4f0d5fc18b88e58fb5bbbf50bf2';
								add: 'f1a2d6376c430f65550efa235209b86c1a0967e3';
								yourself));
				add: ((WEHistory fromRepoPath: '../repositories/numpy' forYML: 'circleci.yml')
						initializeWorkflowCommitsFromIds: (OrderedCollection new
								add: '9e144f7c1598221510d49d8c6b79c66dc000edf6';
								add: '866fed5f2362975a669eaa44ebbbf2ebf2fb8047';
								add: '423368e53448685aae8a46217d9a92db5e611b6d';
								add: 'ced1114d0479aafbb91d8decc9efb0f08a2036d3';
								add: '1a3aa8416033e052e4353548d18a447755afaab4';
								add: '6cb291a913c1e4f0d5fc18b88e58fb5bbbf50bf2';
								add: 'f1a2d6376c430f65550efa235209b86c1a0967e3';
								yourself));
				add: ((WEHistory fromRepoPath: '../repositories/numpy' forYML: 'build_test.yml')
						initializeWorkflowCommitsFromIds: (OrderedCollection new
								add: 'c8e8bfddcc58c77c6ed838e318b27cb58a4e2d20';
								add: '6736c78639300ac50298b4003eea2c5dea90885c';
								add: '72a6f73af24dd5036961cab106962297d61ea1ba';
								add: '423368e53448685aae8a46217d9a92db5e611b6d';
								add: 'fbac77acfb0c74870d61110a0db7227320c6669a';
								add: '73e887aa716abf3854695fd8f930ad8d5d188044';
								add: '2ad82de616ad1cb45fb82574d93ccc617b4038f6';
								add: '5dd15dd7dc5a081cccb94603fedb29f3d838e2ae';
								add: 'b2935ff0f3d1d13d8f211cdb9137e8d38b01edc1';
								add: '24d937546d09e5b7ed9b1075d52dfe63a0acd167';
								add: '91faeaa4a615948b1b91853629242b371030b502';
								add: 'f04688deac761e4fa8b6952eef7e886755efc5e6';
								add: '6a947e53660ea4cce7f1d5fa91b19cb9f6f86b51';
								add: '7929d7074a5e8c2d344f5423850c1fd497116931';
								add: 'd7e1cef3e586c83ff047f9c64e3809d911b0483c';
								add: '2a3b11cc3e84c7f75b4806fc3bac5c4515216bb3';
								add: '938637664b9b67fae3c5e5a318f254ca045b1fe9';
								add: '16342c56bb0047b70a00c955a17b8765e03b1fdb';
								add: 'c0696c5f26f8b45b01c09d21e86c104b7f616577';
								add: '73a9e8ef1168021b5f92eedeb86c42fa90e325d4';
								add: 'efe7024404afb80666badd3675bf575bc8f8c590';
								add: 'fb5f1a7415003d3d27bb9fe41a59b9e01aaf53f7';
								add: '7d2a4656cacf2af84b551dc2825531606d51aca3';
								add: 'a333c5a3f0f12ee607cac16f0a34bcc7d600861f';
								add: '9f72b9148a32cfa4df0d7972281d398f688ee7d5';
								add: '0457cc7da06d98cc818a0ae1d3cc98ea93a1893d';
								add: '351ce2fba342dcf5ed4372f3911157d9ab335c17';
								add: '6f9fb3d8ac617c5aed7572a308237fb5660fd80a';
								add: '5e25f1aff21c346d950bbef1872364c8621253a6';
								add: 'f30d5af3133b70a1c83f7d0ffb2174257e38eddb';
								add: '9f1456860f277fdb5bfc06f29b5e1677c55ed842';
								add: '12612d7f70d62c051d1733522a7b24b066d9cddd';
								add: '8262dc987e8edba4fb261fa5f1e13ed6729d0a8c';
								add: '1907308e81d1a6433772be31acd70d9f97580b51';
								add: 'b8f7fb2c2c6aa80f40db5ce281d9b3597a192845';
								add: '53943536cfea73ec986334d299a9d3256d96c885';
								add: '96789b0327817c379ebb81761c7bba096fef12cd';
								add: 'c0f90b231a24ab705482667cbc5c58424e39fdd0';
								add: 'd5151630e6890417b78e9fce39d8cc244a180c64';
								add: 'f1b5275fe04b783430642f9c0e5e9a07ef3bd6da';
								add: '6c324961c1c8805e1a698ea6928940f44d3430dd';
								add: 'd3b48edb84d40c1269b5cb37f0175270f66bb13a';
								add: '87a3925bd23326e5aeade707a04a0f29f73f1348';
								add: '72261a2e3291bb87abe9fbd75a5197cfc0b41f1f';
								add: '404e41fd16d456d83d4db538b7b39e0269522005';
								add: '4e11afbd4faad41e0119abd55a5bc8dc4a37de29';
								add: '954605ec08ad833899ffb956395f2d70f8eea2df';
								add: 'f9fe1432548688b4f4c2cd2e35b8dd972d8ec51f';
								add: '2b7be2005f3d74141f9f8e83be603be0ddbe7046';
								add: 'de766c8768e87843b601adfc709613e8ff27f957';
								add: 'b3cb7752a456f18eb559f759cba35dd6cb82eb8e';
								add: '0e7ca712891b07341fcd6a01b9834807fd12e49c';
								add: 'dd9b2cbc4a7db7ad6db175a24500362b70ca9f32';
								add: 'aeb0dcfda0ac52f679f93be29f8ff7742d8be324';
								add: '76f2fe1b2ba36ef43386b7c2b3af547d75d34ff6';
								add: '46ada00fd3284b607473b1b514f3d5c06bf72b74';
								add: 'aa2a8cdf7c4c12b71a14a7142aacb7a5f068b666';
								add: '9e99158a616ecc6606f398c20e78cdde83ff5047';
								add: '6cb291a913c1e4f0d5fc18b88e58fb5bbbf50bf2';
								add: 'f1a2d6376c430f65550efa235209b86c1a0967e3';
								yourself));
				add: ((WEHistory fromRepoPath: '../repositories/numpy' forYML: 'docker.yml')
						initializeWorkflowCommitsFromIds: (OrderedCollection new
								add: '527c6e13ae65de08c6d998342b6a836a663c66b4';
								add: '423368e53448685aae8a46217d9a92db5e611b6d';
								add: '7d2a4656cacf2af84b551dc2825531606d51aca3';
								add: '0f7f313d847e8e36e9fb3c4e576619a3af3bfe56';
								add: '128bbb9d861c2de62cd047925b03f28cf2649e2f';
								add: '6cb291a913c1e4f0d5fc18b88e58fb5bbbf50bf2';
								add: 'f1a2d6376c430f65550efa235209b86c1a0967e3';
								yourself));
				add: ((WEHistory fromRepoPath: '../repositories/fastai' forYML: 'docs.yml')
						initializeWorkflowCommitsFromIds: (OrderedCollection new
								add: 'f5184092fe3de30b6efc643d23d91e84741f57af';
								add: '9563a28abc275ff1ae62001e950df17a8df0077e';
								add: 'c186db2c109fe0c25b64a5b76041e231c96044ae';
								add: 'cdc0453813ca6513b475642a0272c86e19def783';
								add: '1f97b39f99e3e767798b12cdb413e692756f050a';
								add: '89a626431df3be4402eb772156279be823dee5d4';
								add: '236e38acc51d95d4569463a02c998199a61b68d8';
								add: '333513b264cb47c12052e647c6669194fb347964';
								add: 'c67a3ef19b7f1868f4b54002031f6df275eb3869';
								add: '0b07ba970ba236c20820ac996613d1298ccfe3d5';
								add: 'c5b281568bd0f1a9121e1e47cbb86675218331ac';
								add: 'eebaeb98bb04dc696091d030c0d0ea4d71923011';
								add: '9e02e07a1fca882959f597727d6a657a26810946';
								add: '6652ff4fe18a75533b1142bf2792f19adf148c1e';
								add: '304e5476900ae76fcc22bd3691cd6adbd3884a96';
								add: '51edd15b0ea08087a5a896794d26a4803ad80e6b';
								add: '9b2587278054132173d862937a8e683fcf94d1bc';
								add: 'e54fbf562dbd1297800c3e5bcfdc5f35d201da41';
								add: 'd751a21d84099e7f31805306514d29bbe4ac73ec';
								add: '046afa5ff59a529d072522fca02a020b05de3bdc';
								add: 'b8e935f8c80bb72d06ffdb5da59d9e3d680f8c5c';
								add: 'aab68c156b89446bab6a4676e0a85d6f4565cb72';
								add: '3710b1ecdec7e541ff04342835e602ae8f527943';
								add: 'f95362e6e645ea95d9cbcbd9f7ff39a4ebf81668';
								add: '487e0a96fe5f6883f7e5e186c5b13a53dcc80664';
								add: '7ec121b4291a37f911c8a3a160f55b65880819f6';
								add: 'bda9331d37c80b27a3811cb6f94189536e754d1a';
								add: 'c29fbce5a8c64858836e23b5b9c5ad3b47ca7910';
								add: '2195ecbae55a3e98ff27bbe93f8a63f3bc95e69d';
								add: '9d8d86b9c8e9b30959cdfc8b60bb9259f87aff0d';
								add: 'a938f5f8b0d34ac6e6db23bb7a1ab05c9dd2dd83';
								add: '108ac78926c01a78c35d1a290eeea08f7c8b8d9b';
								add: 'd441f8a85f02bafb48a6576e58a8b57bb3dbf262';
								add: 'a2361b47e64d33d8fda91ca0eeb5e88a2593e47d';
								add: '9b191cd75427160274b9c60375eb377739bc6710';
								add: '7d4003e740e0e243fa41e3c498f56341da9f066b';
								add: '88b300923f526595bf190f4e5152b9d3658c38ee';
								add: '651a7bdbec0d5f0fa7adaedaf6bf1eca50eb0c32';
								add: 'b5847f2c48d9dd48a39969518124a83180eee267';
								add: 'e787416fcbbe9fe9bb5d31b4fb383c1cb0bfc819';
								add: '6b46c972fef776f27f0f0d5fb90f043f2c85260b';
								add: '641bb25851d7166882934741925f3024c8c93724';
								add: 'c6cc6127be8c152f9d5060406b984537247e7613';
								add: '6c156b0a293a4a8bcbf5cc63173a791fbdb08401';
								add: 'fe989de5d6fc2475fbcedeb14ad2691024ff3222';
								add: '6c769a954c7bfd176b1fb360bc8634aeb6436251';
								add: 'da78daeb7c6d70637e0b8387b4ff9f87e737f24a';
								add: '95bef102af1de6dddbd1f6ce55c27f29e6e3dba6';
								add: '37a4a4d7535abef2f54fec6b12b8a5139ce1feaa';
								add: '106683c4f627a1a0139da6b20261ce9781357d78';
								add: '5fb816a8e7dfb3a17a8891a4a435721e76b17220';
								add: 'eeb317a01e5d4a93603166dbaabbcda849a91d66';
								add: 'bfe66c79ce2d6574b14abc826b03f1a228c6c87b';
								add: '7c297429fe8506e203fd6ff33da6fa3a35f5ef57';
								add: '4262a6159373db4abe60fcf7fcf72644c96e3295';
								add: 'e9efe2b48c765447794f9e46d4e4613555fd77e1';
								add: '8e2a98fd792e338c84e69941b2c273db736a3cbb';
								add: 'befd41280c38bd0cbd365146dff999e25a02c114';
								add: '797bc8bb5a6c2ca49e6f4fff41c81ff0872d1c1f';
								add: 'b5831076edc3e895fa4b0bdf2deae802b35542d0';
								add: '916fd23f8a16f363ef7f31a4b7188d80d146857c';
								add: 'fce57b951b8647cea483e359c2be782819e3fd74';
								add: '0c8173df8893f5c36267059aec1755740692c303';
								add: '0a0df1bb7901fd7d13e33d8e12f9959ff91465cc';
								add: '039e03cf26f271224c2216d0271f8b97835069b2';
								add: '772b66f2ea2fe4c9542f6f08668f5020598c7ea1';
								add: 'a52d36043814f133cca54ea04961f242524b3aa5';
								add: '7ace3cac3dc04cc2dec973d557f13908ea287130';
								add: '18a165a83cb597b9c4d4e4828dc1e2403296e7b6';
								add: 'a123aabdf0400913ec2490ac41963a590c02c96e';
								add: '0ec27b560684467e76104caa80636276f4fdb70e';
								add: '175daa43cf99d4e129864075bf4e28d3fe2a177a';
								add: '7a4ce2b151e7cab4125debc77f301b2374ac68a6';
								add: 'cda8fc3cf483a5a4222ab2e82ef496582883c6d4';
								add: 'bee011205eb5facbdc4b6a2de3f23aaca1c49344';
								add: '34b9be0c59c3a73f46a32e8b4d83d7a5c4d89a14';
								add: 'f0d4f6f0471177f23a06b255081c69882584f43c';
								add: 'a6f4ea183f4638f688ccf21d09a30ed87507b262';
								add: '03199bf7b3123ae2fa377070f1005b4a0cf5cce9';
								add: '39a85341fa37221c68428b7a12e2c65cfa9105ee';
								add: '987ca40481da22e0fafb273c2dedca3414c4fe31';
								add: '143bef3f0017d5081972d74c18719f49d330eee6';
								add: '8eed5b7983c66bb174985aa633dd4e612ce7bdd7';
								add: '07f23c20950d0ad58569ef25862e61aff1b6789d';
								add: 'e5c490b04286fe0384244a7acfae9c3b7ee3648f';
								add: '01b31a7d07700b7c735959a92ae8bc96cc52c0ea';
								add: 'efc19c8758b3c6e0c247195e3adba98ed26e52d9';
								add: '67148b3c20e4b49e7b95591f115c2e219e30d720';
								add: 'aee71cfb469a2dc690485f7f715d85a6823db178';
								add: '8f7ab0a7cf77a9b9ae2cef4208b2de682f350263';
								add: '4848f0f62e1713e8d2482690fe8c0da452f7924e';
								add: '6887fc4bb5fda1a71f29c9ba8d806b93ac428035';
								add: '27e347fd7b231dc4de28eeb222b7330982e28274';
								add: 'd76bbe3419fa01f42c67ea9583ead25df35e5976';
								add: '6dce339e5899f9c7cf0b12835991e90513f6d113';
								add: '5f26eb0dcf650b311d40cb40a3aacc9b2a955a8c';
								add: '043ebb2b00cd8d065d6d207ef133cc742b630690';
								add: '56b74e9f2f4503ea493c7cecb81baa413f5808ab';
								add: 'f41d8ac969e5eec4d731a2597d49e2e7b48d6502';
								add: '2946e4436ed55a71eea7725ef75956745923ec36';
								add: '6573f099446c7e657cbff545ba23f179123b1145';
								add: 'ae05027601e841f84aa24d5a96f446c55c1eb7e0';
								add: 'dde21e84e3c1a99b94c405c30846bae51c3cd8fb';
								add: '4dcae341f7d79d301a5191eae21a6f63efbccc13';
								add: 'd10f15def1c3c1d2f0931c56154185f21b31d5a9';
								add: '251d5ff129a19da79649a849b1ff1b1dd838c72a';
								add: '808c61f10ba6ff5d248f1def6c1fd755dbd9335c';
								add: '13eed0477b1c4ca08026086023ab4ee81a8ac820';
								add: 'f4c3ef5b83830b3f3ce9f9e01cdceccf5d4c47e0';
								add: 'e70e643aad684e864de8667f8177d71acefc370e';
								add: '9a7b3b882fccee41ad6cb2daa07ca32fcc1f89d2';
								add: 'ff0dff1eda65a35e447849540b7b83ee365e2109';
								yourself));
				add: ((WEHistory fromRepoPath: '../repositories/fastai' forYML: 'rsync-tst.yml')
						initializeWorkflowCommitsFromIds: (OrderedCollection new
								add: '95d5956b851517ada0e3a691643585b59eb938e5';
								add: '6e3e77e29b75ae631794f27dcd5c82a6d7b0fea9';
								add: 'cf99776aed2ba132bc277627f991942b6489cb77';
								add: 'ff0dff1eda65a35e447849540b7b83ee365e2109';
								yourself));
				add: ((WEHistory fromRepoPath: '../repositories/fastai' forYML: 'main.yml')
						initializeWorkflowCommitsFromIds: (OrderedCollection new
								add: '53b6aff38eb29faf27aef351a601598f0036537b';
								add: 'b9979305aed70b6ff5842510b0fb0caa99880fb1';
								add: '47fff89a10adcb43367ec8fdf4571e792debd80e';
								add: '399162be47182e6b893848bdb5dfbf6af6cec427';
								add: 'e3401b6c14e110995dd0c6a7f46ec04843907de4';
								add: '89e6d67b3cb7a9cd3d11681f32e7dc044e777bb5';
								add: '6dee33c7c5a1c16d5233123480b06baa465acb0c';
								add: 'e2e5c15680a96fc84ffbc8f57a510f6550fe1316';
								add: '24d2f3999849a33309794ba22e760c29e2f85d78';
								add: '51edd15b0ea08087a5a896794d26a4803ad80e6b';
								add: '1830e766761c2f6d287cc904f6c679c906a43e2a';
								add: '9d59b610bb2acefdc23c9f15092a5c72a5e269b3';
								add: '8d01f872ac54dcaec25721362760abb126f08200';
								add: '9b2587278054132173d862937a8e683fcf94d1bc';
								add: 'f4573df42d8cf1e88feafafbb84874abc861b473';
								add: '657e121e48dfb922a6d122c8a2aea99564d52f12';
								add: '8c832036208decf4ac456141117614b95caad9fc';
								add: 'f7e5bbdd2fe9b340bdda5a376fa52dbfeb1f977f';
								add: 'b814ce779104523e7293637123845938f58d6120';
								add: '409a22a487a7807bb2d00bd688a1bfe7ccb8d01c';
								add: '37c704d85bef51be3b39fd13cc219aa0d018639e';
								add: 'e9b9b85273218c0e2ccef54eea1b41da2d656719';
								add: '3f6d164eac20438abb65a3cf9e65c71315f6a550';
								add: '59fe8692591b3bc55ef08961c7c21e45a6a3b4b5';
								add: '16d2bc86355334ae899f193823ccc75a4f90a4d3';
								add: '5c2c4ddb97796aa368eebeba020291c2c458b520';
								add: '40a43f11b13e629916e386ff205a1b1d47c11669';
								add: 'f061dd4850ffd4718f382282d166c049e6ec15e6';
								add: '78392f228f9992fcf21d2ed49f55c57d7e61ac79';
								add: '745e1e1f99be9c1cef4ed7be2eb28ede75694a91';
								add: '00d88637cd7f804da55473b7c3c31aba4fecba1c';
								add: 'bc062bef1fc988c817e1a1b771371708c4ddb762';
								add: '27578be7ce5ce0f55f1f8987d812b659a56dac5e';
								add: 'fa35da10fe88aab050bde508cf27f822d9eefcbd';
								add: 'f2200289269f09ffb0c200e3220f82fae8afdfba';
								add: '830c5321e855b6d7c8c9664971bfc3d919975ba5';
								add: '0dc2f7b980b5c4f81a3c94bdc6134d8ae3ada9d2';
								add: '3e7ec2a28cac6f4ca084dbd896bbc9610926929d';
								add: '872a5ffa4e6b2bc4a813825d9f0f00ef3292fa94';
								add: '21ffb44048c15de8652f9c71d94cc348f6de8870';
								add: '680c160e21ff438fa8c14a9d2ce81b6fe0fb43ea';
								add: 'fbba0254cdc0de3a325cb87aa94eb25695aa09ff';
								add: 'ed0d5af1d1259f18f41f06f102a68aaef208bc0d';
								add: 'a270b6eb4bada92f121a9f2de32cc45db56cfad6';
								add: 'f4c4b489e315f4da72b81e7b6504f4aba74cf918';
								add: '27c2f4ec2242cd46e29ac6c85de451311f4328f7';
								add: 'c2831a750c1deda480b19fe588f51be4320c3920';
								add: 'c68002e7fe0596d4f347fa7b367342a7a48643f4';
								add: '1b6691533f6efe3d471f19b9736980bf4580d0e9';
								add: '36068b7cbb5d06523d724dbf2eacb9d856191366';
								add: 'bcccc236d3e849f635cf0551185b1f7e2a16f738';
								add: '3d1f7c52d5a8ba77be84ff4dab6d5caad90ca674';
								add: 'f0dfd9c660db6794b3f3aaf4fb8ae66d7c08d756';
								add: '58c3b8d997ec5af6d1c32d06f67a474a2e4f4edf';
								add: '2b2be437dcdf97e5916aeafb8464bad59ce1d9c8';
								add: '6ba814b6485ee52ad3013d1dad00a0056bd3fe52';
								add: 'a1ff75207dfe6d5cf7f7d5b0f4046c840faea55c';
								add: '1153628e273b820bd73d470bde8e333e8ff5d5af';
								add: '613a364e7ebe0fa47f8a824b813c4414943f397f';
								add: 'd4e76b50a4e3e982a743a4ae6de121f71a3323c0';
								add: '7c56bcab0f1769349d05ea83d52f14c378b701dd';
								add: '0fd766a2ff748d72fef69ad8b383627d5b25ebb2';
								add: '468f14a4a2c54bcb070ea77fffbbdbf4af23edeb';
								add: '6cf2c3e4ce71290ddcd5209ca89f478b3e46c2cc';
								add: 'ab97a74ccef484df4c97f5f31d3ae5938bf4e497';
								add: 'c675f85e82d37ac38c91018995c3188a09bc7487';
								add: 'bfe6724ecefa350fa26f8857437553f0728217db';
								add: 'e6e05c58579c87f8d532e4a8866155768e155bb0';
								add: 'db9ac7ee81d5cec15a08b8217e8f2602b4dec6f1';
								add: '5d07b324f348764455d2aeb0d1dcc93d208bd916';
								add: '6b372357ac7a6915d9101e04d7e9c9a9af936efa';
								add: '6e12644746aa0c691d23b591c1d8579b11575eb6';
								add: '083d982321dbaba65a793293a9daf540fe96db87';
								add: '3921ee416224be9bef5689a1df161348338de6e7';
								add: '8008733ddc3ad145759eb4d0c4d04c70b1dabc82';
								add: '32288e2f8f34a7b760d6eed66b418502560d44a1';
								add: '989eb711dfaa8aa624932a396225f142715f9a22';
								add: 'bc0ef9ac08d2ac4497fc1ef519b99ab4dda10c65';
								add: '9dcf2ff75e7e4565b71d494f1114d7bd4d2ecda7';
								add: 'a87ee34de1c01aee5c0de48c8a5f05dfab6ccfd9';
								add: '04713477e7fd1f12b8f7616e4163b95c78ab66da';
								add: '4fbbe6794e0ba626c6e7cebfea68ea59dbea70ed';
								add: '6566a6ebfe09bac95f2b58df3c4b23ed49dee72d';
								add: '8c3618834c58d8768975ac3dd84ce65a8cb46fdc';
								add: '7a7dfec9668d836307d1ca302ac95c4d4dc88d63';
								add: '65c27f6a92cf248e1f5ccf309e1c5f71f7f056bf';
								add: '63626274b220da86a62a3a65a14bf2fc0cfb362a';
								add: 'c112af5c7047f0badb6e5bb00b30ba8d2c6280ae';
								add: '5761ca0ee39b6b7ee3c0495d5b1f527f5031ea9c';
								add: '2534785c3a7b85de5b5b40182a40864b20d0b9fd';
								add: '46882c150f77ba60fca440f403536028ac18428f';
								add: '794702e87d8e46f75cb25900494fc3294c12a13f';
								add: '41b011cfa1fd6b9f152817442cbe05791434a1ca';
								add: '3c9d583b7c055d28c0e7a6eaa0fbb4c8d529573d';
								add: 'c508bd6c558a725cbda0053dc5203e48240b40d2';
								add: '6dc6feaab3cc9e5bbf3e5c29f95dcb4b299253b8';
								add: 'a8fec18b8ef049dc70e66a60505e31dcc617a9f3';
								add: 'd784338c37fb06318cce3d49a6d5df83a395c49d';
								add: '98b70c331caef09c4eade736b1b4ee21ac8d16d2';
								add: 'bfd965fd1beedcf105e10ba14e945529bb1f2263';
								add: 'be1fbb00eb76309063160e6c493adb7a5b02bc03';
								add: '5236a3f60d18d289136d85a3231c3c47e8f31cbe';
								add: '674f1afe8ecb8b995a0aeed8a8aedf3096f09951';
								add: 'c6ca14b31e88258de35f7743cd36aaf23bbf8fe5';
								add: '417537e2be98013d7ef62e6dcc71e4bb27cbbf25';
								add: '142c4747c1dbf73c07081ddcd277007f9c03aec7';
								add: 'ce4b3f09b3478064432fb7ebd86f724d80e4a210';
								add: '3692708b409a8004cda3ea134a237c216a750f44';
								add: 'b2528ab4f4f3fda1c1807ab319dba6f9ef396ee0';
								add: 'c8766473daa925dbef4dbfd92d05e56e18cfdd4b';
								add: '0cbc85d5afb84e7217404ee47d7866d7dcbd128a';
								add: '5a102284e685511e69e93b9fde8ca8b1ea588c4e';
								add: '507233cc67759296556b34640df09429adca0476';
								add: '84d083973e68f041a08451c0034f664c904465d9';
								add: '957a0f6b35ecf0f079525d90e74a01a5c42271db';
								add: '5fed34aec5ff33f7ab3012ad600f5fd5e90ad104';
								add: '745146df1eaf49bd1ba32c18bdf32faeeb5f143f';
								add: 'ff0dff1eda65a35e447849540b7b83ee365e2109';
								yourself));
				yourself)) updateHistories
]

{ #category : #accessing }
WEHistories >> addHistories: aHistory [
	self histories add: aHistory
]

{ #category : #accessing }
WEHistories >> gtInitializedHistoriesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Initialized Histories';
		priority: 30;
		items: [ self initializedHistories ];
		column: 'Repo' text: [ :each | each repoPath ];
		column: 'YML file' text: [ :each | each ymlFile ];
		column: 'Commits size' text: [ :each | each workflowCommits size ];
		updateWhen: ValueChanged in: [ self initializedHistories announcer ];
		updateWhen: ValueRemoved in: [ self initializedHistories announcer ]
]

{ #category : #accessing }
WEHistories >> gtWorkflowHistoriesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Workflow Histories';
		priority: 20;
		items: [ self histories ];
		column: 'Repo' text: [ :each | each repoPath ];
		column: 'YML file' text: [ :each | each ymlFile ];
		column: 'Size' text: [ :each | each workflowCommits size ]
]

{ #category : #accessing }
WEHistories >> histories [
	^ histories
]

{ #category : #initialization }
WEHistories >> histories: aHistoryCollection [
	histories := aHistoryCollection
]

{ #category : #computation }
WEHistories >> historyTasks [
	^ self histories collect: [ :each | [ each initializeWorkflowCommitsNicely ] ]
]

{ #category : #accessing }
WEHistories >> initialize [
	mutex := Semaphore forMutualExclusion.
	self processes: OrderedCollection new.
	self histories: OrderedCollection new.
	self initializedHistories: OrderedCollection new asValueHolder
]

{ #category : #computation }
WEHistories >> initializeHistoryTasks [
	self histories do: [ :each | each initializeWorkflowCommits ].
	self updateHistories
]

{ #category : #accessing }
WEHistories >> initializedHistories [

	^ initializedHistories
]

{ #category : #accessing }
WEHistories >> initializedHistories: anObject [

	initializedHistories := anObject
]

{ #category : #computation }
WEHistories >> killHistoryTasks [
	processes do: #terminate
]

{ #category : #accessing }
WEHistories >> processes [

	^ processes
]

{ #category : #accessing }
WEHistories >> processes: anObject [

	processes := anObject
]

{ #category : #computation }
WEHistories >> spawnHistoryTasks [
	| maxLength |
	self killHistoryTasks.
	self initializedHistories removeAll.
	mutex := Semaphore forMutualExclusion.
	processes := OrderedCollection new.
	maxLength := self historyTasks size.
	(self historyTasks copyFrom: 1 to: maxLength)
		do: [ :task | 
			| value |
			processes
				add: ([ value := task value.
					mutex critical: [ self initializedHistories addLast: value ] ]
						forkAt: Processor userBackgroundPriority - 1) ]
]

{ #category : #accessing }
WEHistories >> storeOn: aStream [
	aStream
		nextPutAll: '(';
		nextPutAll: self className;
		nextPutAll: ' from: ((OrderedCollection new)';
		nextPutAll: String cr.

	self histories
		do: [ :each | 
			aStream nextPutAll: 'add: ('.
			each storeOn: aStream.
			aStream
				nextPutAll: ');';
				nextPutAll: String cr ].

	aStream nextPutAll: 'yourself )) updateHistories'
]

{ #category : #computation }
WEHistories >> updateHistories [
	self initializedHistories addAll: self histories asValueHolder
]
