/*
Navicat MySQL Data Transfer

Source Server         : lancs
Source Server Version : 50628
Source Host           : localhost:3306
Source Database       : lancs

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2017-03-10 18:36:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `alembic_version`
-- ----------------------------
DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alembic_version
-- ----------------------------
INSERT INTO `alembic_version` VALUES ('fb42722c831f');

-- ----------------------------
-- Table structure for `articles`
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `visitNum` int(11) DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  `message_type` int(11) NOT NULL,
  `icon` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of articles
-- ----------------------------
INSERT INTO `articles` VALUES ('8', '中山大学-微软亚洲研究院创新人才培养直博生项目交流会及学术报告', '一、直博生项目\r\n\r\n中山大学-微软亚洲研究院创新人才培养直博生项目是由中山大学和微软亚洲研究院联合发起的关于创新型人才培养模式的重要探索。联合培养直博生项目每年在中山大学大三本科生中选拔优秀学生作为该项目的候选人，然后从中选拔直博生，直博生研究生阶段将由微软亚洲研究院和中山大学联合培养，主要研究方向为人工智能和计算机视觉。\r\n\r\n本项目选拔人才主要考察学生的研究潜质，要求数理基础扎实。数学好，编程好和英语好的“三好学生”是本项目最为青睐的学员。申请人同时还应具有优秀团队合作精神。直博生项目新一年度的申请已经启动。主要面向中山大学本科学生，专业不限，具体名额待定。课业成绩与排名会作为参考依据，但不是按照排名选择。只要你有潜质，有热情，有志于在计算机研究领域发展，都可以申请本项目。欢迎同学们踊跃报名。\r\n\r\n二、学术报告\r\n\r\n本次的学术报告邀请到了微软亚洲研究院的两位资深研究员，主题如下：\r\n\r\nTitle: Knowledge Mining for Enterprise Productivity\r\n\r\nSpeaker: 纪蕾，Researcher, MSRA\r\n\r\n \r\n\r\nTitle: Visual Storytelling Generating Human-level language from Personal Media Collections\r\n\r\nSpeaker: 傅建龙, Researcher, MSRA\r\n\r\n 233333\r\n\r\n时间：12月13日（星期二）19:00-20:30\r\n\r\n地点：数据科学与计算机学院院楼a101', '2', '2017-03-06 11:36:29', '0', '/static/upload/article\\8.png');
INSERT INTO `articles` VALUES ('9', '中山大学获批与北京大学共建大数据分析与应用技术国家工程实验室', '近日，国家发展和改革委员会正式批复同意由北京大学牵头，联合中山大学、中国科学院数学与系统科学研究院、北京奇虎科技有限公司、北京嘀嘀无限科技发展有限公司等单位共同建设大数据分析与应用技术国家工程实验室。\r\n\r\n大数据分析与应用技术国家工程实验室计划建设大数据预处理技术平台、大数据共性模型与算法平台、数据挖掘技术平台、可视分析平台、智能知识管理与决策支持平台等五个研发平台。实验室核心团队包括院士4人，千人计划3人，长江学者3人以及“杰青”6人，“优青”8人，青年千人5人等一大批活跃在大数据领域的年轻学者、业界专家。\r\n\r\n针对我国大数据分析技术和综合应用能力弱、缺乏面向应用的原创性分析方法等问题，实验室的主要任务是围绕提升大数据综合分析能力与智能决策水平的迫切需求，建设大数据分析技术研发与应用试验平台，形成国内一流的科研环境，培养和汇聚大数据分析技术研发与应用高端人才，主动承担国家和行业重大科研项目，在大数据统计学习、文本大数据分析、图像视频大数据分析、时空大数据分析、图数据管理和知识图谱分析等重点研究方向取得一批关键技术成果并成功转化，构建大数据分析应用领域自主知识产权与标准体系，形成可持续的产学研协同创新机制，为推动我国大数据分析与应用的技术进步和产业发展提供技术支撑。\r\n\r\n![](/static/upload/md_images/20170304130331.png)\r\n\r\n中山大学作为该实验室重点共建单位之一，由数据科学与计算机学院具体承担实验室的建设任务。学院将依托国家超级计算广州中心（“天河二号”超级计算机）、大数据科学研究中心（国家自然科学基金委员会与广东省人民政府联合资助）两大平台，重点在大数据挖掘技术、面向天河二号的并行计算的可计算建模、面向天河二号的大数据分析软件支撑平台与系统、机器学习与数据挖掘算法、基于融合计算架构的大数据分析处理技术、面向医疗健康、智慧交通等领域的大数据应用等方向开展科学研究及工程化的工作。\r\n\r\n作为国家级的大数据分析与应用技术研发平台，实验室的建设将促进中山大学在大数据技术研究和应用方面的发展，提升相关学科的建设水平、人才质量，也将为广东省、广州市的大数据产业发展起到重要推动作用。', '4', '2017-03-05 20:53:29', '0', '/static/upload/article\\9.png');
INSERT INTO `articles` VALUES ('10', '学术报告：Machine to Machine Communications for Internet of Things', 'Title: Machine to Machine Communications for Internet of Things\r\n\r\n时间：2016年12月15日（周四）上午9:30-11:30\r\n\r\n地点：数据科学与计算机学院A101\r\n\r\nAbstract: Connected smart objects, platforms and environments have been identified as the next big technology development, enabling significant society changes and economic growth. The entire physical world will be connected to the Internet. The intelligent network for automatic interaction and processing between objects and environments, referred to as the Machine to Machine Communications (M2M) for Internet of Things (IoT), will become an inherent part of areas such as electricity, transportation, industrial control, utilities management, healthcare, water resources management and mining. Wireless networks are one of the key enabling technologies of the IoT. They are likely to be universally used for last mile connectivity due to their flexibility, scalability and cost effectiveness. In this talk, I would like to give an overview of wireless M2M development, architecture, key challenges, requirements and our recent works in this exiting area.\r\n\r\nBiography: Yonghui Li received his PhD degree in November 2002 from Beijing University of Aeronautics and Astronautics. From 1999 – 2003, he was affiliated with Linkair Communication Inc, where he held a position of project manager with responsibility for the design of physical layer solutions for the LAS-CDMA system. Since 2003, he has been with the Centre of Excellence in Telecommunications, the University of Sydney, Australia. He is now a Professor and Director of Wireless Engineering Laboratory, in School of Electrical and Information Engineering, University of Sydney. He is the recipient of the Australian Research Council (ARC) Queen Elizabeth II Fellowship in 2008 and ARC Future Fellowship in 2012. His current research interests are in the area of wireless communications, Internet of Things and recently on machine learning. He has published more than 200 papers in IEEE journals and conferences. 4 of his journal papers have been included in Thomas Reuters ISI highly cited papers. According to google scholar, his research works have been cited more 4000 times with H-index of 32. His now an editor for IEEE Transactions on Communications, IEEE Transactions on Vehicular Technology and an executive editor for European Transactions on Telecommunications (ETT). He received the best paper awards from IEEE International Conference on Communications (ICC) 2014 and IEEE Wireless Days Conferences (WD) 2014.', '0', '2017-03-04 13:05:12', '0', '/static/upload/article/test.png');
INSERT INTO `articles` VALUES ('11', '学术报告:Location privacy ：where do we stand and where are we going?', '报告题目： Location privacy ：where do we stand and where are we going?\r\n\r\n时间：2016年12月19日，15：30--17:00\r\n\r\n地点：数据科学与计算机学院A101讲学厅\r\n\r\n报告人：Fernando Pérez-González , Ph.D. , IEEE Fellow ,Professor ,       University of Vigo,SPAIN\r\n\r\n主持人：康显桂教授\r\n\r\n主办单位：数据科学与计算机学院，广东省信息安全技术重点实验室 \r\n\r\nAbstract：Over time, users have become accustomed to sharing personal data when they install new apps in their smartphones. Declining to do so, normally aborts the installation process. Sadly, users have convinced themselves that the value of their data is much lower than that of the apps they install, “after all, they have nothing to hide”. And thus, in redefining their business models many companies have touted better services and applications which even come for free, in exchange for some loss of privacy. However, as we will argue, privacy and utility do not necessarily make up a zero-sum game.\r\n\r\nIn the case of space-time location, a kind of information that should be considered private, there are a number of alternatives for adversaries to learn it, ranging from the triangulation of cellular phone signals to the metadata of pictures shared in social networks. Using the powerful inference capabilities of data mining, some companies are even promising to combine all the available inputs to predict what will be the location of a person in the near future. A recent MIT study showed that with only four approximate space-time points, it was possible to univocally de-anonymize a user in a database with 1.5 million of them. And this might be only the beginning, as ever more intrusive applications step in. Even putting such Orwellian perspective aside, it is easy to understand the immense value of location data. But there is more that users can do than giving up...\r\n\r\nIn this talk we will revisit the techniques, some of them little known, that can be applied to find out where we are, and the potential threats that they entail when combined with data mining. Guaranteeing location privacy turns out to be an elusive problem, starting with the lack of one-fits-all definitions. We will describe the technologies that have been proposed during the last decade to protect location privacy, including anonymization, obfuscation, mixes, and processing with encrypted signals. Those technologies stand at the crossroads of several disciplines such as signal processing, information theory, software engineering, database management, game theory and cryptography. But we will also adopt a critical point of view: in complicating the setups and definitions, researchers have failed to answer some fundamental questions that we will single out. To conclude, we will discuss the challenges that lie ahead and their practical and societal impact.\r\n\r\nBio：Fernando Pérez-González received his Ph.D. in Telecommunication Engineering from the University of Vigo, Spain, in 1993. He is Professor at the Signal Theory and Communications Department, University of Vigo since 2000, where he leads the Signal Processing and Communications Group (GPSC).\r\n\r\nIn 2007-2014 he was the founding Executive Director of the Galician Research and Development Center in Advanced Telecommunications (GRADIANT), a semi-private research center. From 2009-2012 he was the holder of the prestigious Prince of Asturias Endowed Chair on Information Science and Technology at the University of New Mexico (UNM).\r\n\r\nHis research interests lie in the crossroads of signal processing, security/privacy and communications, in particular, those problems in which an adversary is present. Prof. Pérez-González has coauthored more than 200 journal and conference papers, 15 international patents, and has participated in 5 European projects related to multimedia security. He has served in the Editorial Board of several international journals, including IEEE Trans. on Information Forensics and Security and IEEE Signal Processing Letters.\r\n\r\nHe is a member of the Galician Royal Academy of Sciences and an IEEE Fellow.', '0', '2017-03-04 13:05:38', '0', '/static/upload/article/test.png');
INSERT INTO `articles` VALUES ('12', '中山大学获批与清华大学共建大数据系统软件国家工程实验室', '近日，国家发展改革委员会正式批复同意由清华大学作为承担单位牵头，联合中山大学、国防科学技术大学、百度、腾讯等相关单位共同建设大数据系统软件国家工程实验室。这是承担我国大数据系统软件技术研发与工程化的唯一国家级创新平台。\r\n\r\n大数据系统软件国家工程实验室以创新驱动发展和自主安全可控为使命，以国家“十三五”规划为指导，面向重点领域和重大工程需求，建设大数据系统软件技术创新研发、技术转化和应用示范平台，支撑大规模多源异构数据一体化管理、交互式异构数据分析框架、数据可视化与智能数据工程、领域大数据应用开发运行环境、大数据混源软件可信验证等技术的研发和工程化。\r\n\r\n实验室将打造产学研用一体化的体系，研发一系列国际先进、国内领先的大数据系统软件核心技术与产品，突破创新驱动产业转型升级以及关键领域自主可控中的技术瓶颈，探索大数据系统软件应用实施的工程方法，建设国际一流、开放协同的产学研用大数据系统软件技术创新团队。与公安部一所、沈阳消防研究所、国家气象中心、环保部信息中心、北京工业大数据创新中心、中国农科院等重点应用单位建立合作关系，支撑政府治理、公共服务、工业和新兴产业、现代农业等国家重大战略方向的大数据应用，增强对国家重点工程的大数据应用的保障能力。\r\n\r\n中山大学作为该实验室重点共建单位之一，由数据科学与计算机学院具体承担实验室的建设任务。学院将依托国家超级计算广州中心（“天河二号”超级计算机）、大数据科学研究中心（国家自然科学基金委员会与广东省人民政府联合资助）两大平台，重点在大数据一体化管理、混合式分布并行大数据分析处理架构、大数据并行处理基础算法等方向开展科学研究及工程化的工作。\r\n\r\n作为国家级的大数据系统软件研发平台，实验室的建设将促进中山大学在大数据技术研究和应用方面的发展，提升相关学科的建设水平、人才质量，也将为广东省、广州市的大数据产业发展起到重要推动作用。', '0', '2017-03-04 13:06:52', '0', '/static/upload/article/test.png');
INSERT INTO `articles` VALUES ('13', '学院党委召开“两学一做”学习教育专题培训会', '2016年5月27日下午，数据科学与计算机学院党委召开“两学一做”学习教育专题培训会，学院教工党支部委员会成员、学院党务秘书、学院学生党建指导老师等参加培训。培训会由学院党委谢曼华书记主持。\r\n\r\n谢曼华书记首先总结了我院党委在前一阶段开展“两学一做”学习教育的情况，并围绕《广东省“两学一做”学习教育工作指引》，就如何进一步开展“两学一做”学习教育做了培训和安排。\r\n\r\n谢书记指出，开展“两学一做”学习教育要熟记六项重点内容，把握好“123456”：“1”就是“要做”，做合格党员；“2”就是“两学”，学党章党规、学系列讲话；“3”就是“三个基本”，以党支部为为基本单位，以党的组织生活为基本形式，以党员教育管理制度为基本依托；“四”就是“四讲四有”，做讲政治、有信念，讲规矩、有纪律，讲道德、有品行，讲奉献、有作为的合格党员；“5”就是“五个问题”，通过学习教育，着力解决一些党员理想信念模糊动摇、党的意识淡化、宗旨观念淡薄、精神不振、道德行为不端等五个方面的问题；“6”就是“6项措施”，通过个人自学、集体学习讨论、创新方式讲党课、召开党支部专题组织生活会、开展民主评议党员、立足岗位作贡献等六项措施推进学习教育。\r\n\r\n开展“两学一做”学习教育还要掌握五项原则方法，即坚持日常学习教育管理制度、注意分层分类推进、注重发挥典型作用、领导干部带头、坚持学习教育与推进本地本单位日常工作相结合。\r\n\r\n开展“两学一做”教育活动是以党支部为基本单位，各党支部要做好10项规定动作，即召开支部委员会研究 、制定方案、动员部署、组织个人自学、组织开展集中学习讨论、创新方式讲党课、召开专题组织生活会和开展民主评议党员、制定整改台账、立足岗位作贡献、收集整理学习教育的档案材料。\r\n\r\n谢书记还强调了党支部在开展“两学一做”学习教育的责任所在，并对下一步的工作安排进行了部署，强调各党支部要尽快召开支部委员会研究讨论并制定方案，在前期已经动员的基础上，组织开展个人学习并开展集中学习讨论；各党支部书记要在6月份给支部党员讲一次“两学一做”主题的党课。\r\n\r\n', '0', '2017-03-04 13:07:37', '0', '/static/upload/article\\13.png');
INSERT INTO `articles` VALUES ('14', '学术报告：可学习过滤器在低、高层次视觉问题上的最新研究', '题   目: 可学习过滤器在低、高层次视觉问题上的最新研究\r\n\r\n主   讲:  Ming-Hsuan Yang，加州大学梅森分校电气工程与计算机科学系副教授\r\n\r\n时   间：2016年12月30日（周五）上午10：00-12：00\r\n\r\n地   点：数据科学与计算机学院A101学术报告厅\r\n\r\n主   持：林倞教授\r\n\r\nAbstract:\r\n\r\n具有众多优异性质的可学习滤波器，能有效地解决各种低、高层次计算机视觉任务，例如目标检测、识别和样式风格转换。其研究的重点在于：如何从学习的角度来利用低层次视觉任务的重要视觉线索。本次讲座将从构建混合神经网络将许多低级视觉问题（例如，保留边缘滤波和去噪）作为递归图像滤波过程、基于学习的方法来构建基于卷积神经网络的联合滤波器和映射朦胧图像及其相应的透射图方法出发，为大家展示可学习过滤器在低、高层次视觉问题上的最新研究。\r\n\r\nSpeaker Bio:\r\n\r\nMing-Hsuan Yang 教授，现任加州大学梅森分校电气工程与计算机科学系副教授。他于2000年在伊利诺伊大学厄巴纳—香槟分校获得计算机科学博士学位。他是多个会议的区域主席，包括IEEE计算机视觉和模式识别会议 (CVPR)，IEEE计算机视觉国际会议 (ICCV)，欧洲计算机会议视觉 (ECCV)，亚洲计算机会议，AAAI全国人工智能会议和IEEE国际自动面部和手势识别会议。他是2019年IEEE计算机视觉国际会议与2014年亚洲计算机视觉会议 的计划共同主席，以及2016年亚洲计算机视觉会议的通用共同主席。也是著名IEEE 模式分析与机器智能期刊 T-PAMI(2007 至2011)，计算机视觉国际杂志 (IJCV), 计算机视觉与图像理解 (CVIU)，图像和视觉计算，人工智能研究杂志的副主编。他于2009年获得Google教师奖， 2011年获得加州大学默塞德分校颁发的杰出早期职业研究奖，于2012年获得国家科学基金会颁发的教师早期职业发展（CAREER）奖，以及2015年获得美国参议院杰出研究奖。', '3', '2017-03-04 13:10:06', '0', '/static/upload/article\\14.png');
INSERT INTO `articles` VALUES ('16', '夯基固石，扬帆起航——计算机学院圆满完成民主评议党员工作', '在学校党委组织部下发《关于在“两学一做”学习教育中召开专题组织生活会和开展民主评议党员的通知》后，我院党委积极响应号召，及时召开支部书记会议传达通知精神，布置开展民主评议党员工作，强调组织纪律，培训工作要点。为加强评议效果，学院党委特别编制了“民主评议党员自评、互评指引”，指导党员从学习、工作、生活等细微之处开展批评和自我批评。\r\n\r\n 2017年2月26日晚10点，随着最后一个支部的民主评议党员专题组织生活会结束，我院党委所辖33个党支部均全部完成民主评议党员工作。每位党员在前段“两学一做”学习教育的基础上，对照“四讲四有”合格党员标准，查找自身在政治、纪律、品德、作用四个方面存在的问题，进行自我批评、作出自我评价，进一步坚定党的信念，端正入党动机，强化党的观念，牢固党员意识，增强提升个人党性修养的内在驱动力；各党支部也通过以评促建，查找组织生活规范、党员教育管理以及自身建设等方面存在的问题，明确了进一步发挥战斗堡垒作用的方向。\r\n\r\n本次民主评议党员，各党支部均能抓住“组学习、广谈话、真批评、促整改”的工作关键任务，利用寒假期间积极开展“组学习牢思想”、“广谈话求意见”等工作。开学后立即召开民主评议党员专题组织生活会，会上党员均能围绕“两学一做”的学习成效，以及“四讲四有”合格党员标准查摆个人问题，坚持以实事求是、公平公开的原则，严肃认真地开展批评和自我批评。支部委员带头坚持问题导向，切实展开批评，并提出支部工作中存在的问题，并广泛听取党员的意见和建议，明确整改的方向。\r\n\r\n为提升评议效果，学院谢曼华书记、陈征宇副书记、马啸副院长、杨宏奇副院长等党政领导班子成员均参加了各个支部的组织生活会，指导民主评议党员工作。', '1', '2017-03-04 13:10:55', '0', '/static/upload/article\\16.png');
INSERT INTO `articles` VALUES ('17', '数据科学与计算机学院党委关于评定院级、推荐校级优秀共产党员、优秀党务工作者、先进党支部名单的公示', '数据科学与计算机学院党委关于评定院级、推荐校级优秀共产党员、优秀党务工作者、先进党支部名单的公示\r\n各党支部：\r\n    经过前期各党支部民主推荐、学院党政联席会审批，现将学院党委院级优秀共产党员、优秀党务工作者、先进党支部的名单以及推荐参评校级优秀共产党员员、优秀党务工作者、先进党支部名单公示如下：\r\n    一、院级优秀共产党员（39名，以姓氏笔画为序）：\r\n    教工（14名）：马啸、毛明志、印鉴、江颖、农革、李奈青、李斯、吴维刚、陆勇、陈晓南、郑慧诚、饶洋辉、黄玲娟、廖雪莹\r\n    学生（25名）：王子佳、卢建业、叶嘉骏、刘万腾、刘招斌、刘剑萍、李展文、杨睿、何键浩、余嘉豪、张婷婷、陈向妍、陈志燕、陈佳捷、范文琦、尚孟昕、罗嘉文、钟盼盼、莫沛明、黄文韬、黄育钊、黄超、梁日荣、葛勇峰、温诗华\r\n     二、院级优秀党务工作者（3名）\r\n    谢曼华（学院党委书记）\r\n    周国初（数据科学研究所党支部组织委员）\r\n    成  慧（大数据与计算智能研究所党支部宣传委员）\r\n    三、院级先进党支部（7个）\r\n    软件工程本科生国防生党支部\r\n    移动信息工程2013级本科生党支部\r\n    计算机硕士2014级A班党支部\r\n    软件工程本科生第六党支部\r\n    软件工程本科生第三党支部\r\n    软件工程本科生第八党支部\r\n    软件工程本科生第九党支部\r\n    四、推荐参评校级优秀共产党员（13名，按姓氏笔画排序）\r\n    马啸、印鉴、刘招斌、江颖、吴维刚、何键浩、陆勇、陈志燕、陈晓南、尚孟昕、莫沛明、黄玲娟、梁日荣\r\n    五、推荐参评校级优秀党务工作者（1名）\r\n    谢曼华（学院党委书记）\r\n    六、推荐参评校级先进党支部（3个，按推荐顺序排序）\r\n    软件工程本科生国防生党支部\r\n    移动信息工程2013级本科生党支部\r\n    计算机硕士2014级A班党支部\r\n    推荐参评校级优秀共产党员、优秀党务工作者、先进党支部并最终获评者，将不再进行院级表彰。\r\n    公示期：2016年5月17-19日\r\n    联系人：李老师\r\n    电话：39336520\r\n \r\n数据科学与计算机学院党委\r\n2016年5月17日', '3', '2017-03-04 13:11:20', '0', '/static/upload/article\\17.png');
INSERT INTO `articles` VALUES ('18', '学术报告：Efficient Non-Interactive Multi-Client Searchable Encryption with Support for Boolean Queries', '题 目：Efficient Non-Interactive Multi-Client Searchable Encryption with Support for Boolean Queries\r\n\r\n报告人：Dr. Joseph Liu (廖啟瑞博士)，Monash University, Australia\r\n\r\n日 期：2016年12月20日（星期二）\r\n\r\n时 间：上午10点-11：30\r\n\r\n地 点：A203学术报告厅\r\n\r\n主持人：张方国教授\r\n\r\n摘 要：Motivated by the recent searchable symmetric encryption protocol of Cash et al., we propose a new multi-client searchable encryption protocol in this work. By tactfully leveraging the RSA-function, our protocol avoids the per-query interaction between the data owner and the client, thus reducing the communication overhead significantly and eliminating the need of the data owner to provide the online services to clients at all times. Furthermore, our protocol manages to protect the query privacy of clients to some extent, meaning that our protocol hides the exact queries from the data owner. In terms of the leakage to server, it is exactly the same as Cash et al., thus achieving the same security against the adversarial server. In addition, by employing attribute-based encryption technique, our protocol also realizes the fine-grained access control on the stored data. To be compatible with our RSA-based approach, we also present a deterministic and memory-efficient `keyword to prime\' hash function, which may be of independent interest.\r\n\r\n报告人简介：Joseph Liu (廖啟瑞博士)，澳大利亚蒙纳士大学(Monash University)信息技术学院 (Faculty of Information Technology)资深讲师，担任过一些国际会议的主席，包括ProvSec 2007, 2014 以及 ACISP 2016 等。2004年取得香港中文大学信息工程系的博士学位，主要研究范围包括：网络安全、个人隐私、身份核实、公钥密码、云安全、智能城市安全等。之前，在新加坡资讯通讯研究院(Institute for Infocomm Research, I2R)担任过7年研究院。共发表超过100篇论文，包括多份 IEEE 期刊 (例 如 IEEE TIFS, IEEE Trans. on Computers, IEEE TKDE, IEEE Trans. on Vehicular Technology, IEEE Network 等)，其中两篇论文更获 ESORICS 2014 及 ESORICS 2015 颁发最佳论文奖。 论文被引用超过3500 次， H 指数高达26。其中一项有关轻量级密码学的研究，在2013年被ISO采纳成国际标准，供业内同行使用。', '1', '2017-03-04 13:11:49', '0', '/static/upload/article\\18.png');
INSERT INTO `articles` VALUES ('19', '计算机视觉研究组团队特聘副研究员招聘启事', '因工作需要，数据科学与计算机学院计算视觉研究组团队（郑伟诗老师）需招聘特聘副研究员1名，具体如下：\r\n\r\n一、岗位要求：\r\n\r\n能按研究组要求兼顾科研和工程研发组织工作，着重负责研究团队的工程研发组织工作。在完成学校岗位要求前提下，岗位绩效主要与工程项目研发挂钩，不设上限。\r\n\r\n二、岗位招聘条件\r\n\r\n（1）有较好的机器学习应用算法研究背景，其研究主要应用于视频图像识别；\r\n\r\n（2）具有国内外知名高校博士学位，且近五年以第一作者发表SCI或EI论文3篇以上（要求在主要国际期刊和著名国际学术会议及以上发表论文）；\r\n\r\n（3）具有国内外知名高校、研究机构讲师、助理研究员职称，或将要博士毕业的学者；\r\n\r\n（4）研究方向：模式识别、计算机视觉与机器学习；\r\n\r\n（5）年龄在38岁以下；\r\n\r\n（6）在计算机视觉、模式识别、机器学习领域的主流权威国际期刊（可参考中国计算机学会推荐目录B类及以上）或国际公认的计算机视觉和机器学习顶级会议以第一作者发表论文2篇以上者优先。如果发表过TPAMI/TIP等顶级期刊，条件可适当放宽。\r\n\r\n三、报名时间：\r\n\r\n即日起至招满为止，（请留意联系人网页：http://isee.sysu.edu.cn/~zhwshi/RESEARCH_FACULTY.html 或http://www.eecs.qmul.ac.uk/~jason/RESEARCH_FACULTY.html）\r\n\r\n四、联系方式：\r\n\r\n联系人：郑老师\r\n\r\nE-mail：wszheng@ieee.org (请同时发备份邮件至：wuancong@gmail.com)\r\n\r\n地址：广州大学城外环东路132号中山大学数据科学与计算机学院\r\n\r\n邮编：510006', '0', '2017-03-06 19:34:16', '1', '/static/upload/article/test.png');
INSERT INTO `articles` VALUES ('20', '中山大学公开招聘机器智能与先进计算教育部重点实验室正副主任的启事', '为保证实验室持续稳定发展，中山大学机器智能与先进计算教育部重点实验室将于近期换届。根据《高等学校重点实验室建设与管理暂行办法》的有关规定，经研究，现向校内外公开招聘机器智能与先进计算教育部重点实验正副主任各一名，具体事项通知如下：\r\n\r\n一、中山大学机器智能与先进计算教育部重点实验室简介\r\n\r\n针对国家在电子信息行业的发展需求，瞄准学科的前沿发展趋势，以建立具国际竞争力的学术研究、学术交流、人才培养和技术合作的平台和基地为目标，中山大学在2007年开始筹建机器智能与先进计算教育部重点实验室，并于2012年顺利通过教育部验收。自成立以来，实验室一直开展机器智能与先进计算领域的基础理论与关键技术的研究。经过多年的努力，实验室逐渐发展壮大，在“ 数字媒体技术和智能信息处理”、“智能感知与高性能计算”、“计算智能”和“云计算与大数据”四个方向上建立了基础理论与 应用研究团队，在基础理论与核心技术研发、人才队伍建设、专利池建设、标准规范制定、开放联合机制建设以及产业推进等方面 取得了良好成绩。\r\n\r\n实验室始终坚持面向机器智能与先进计算的科学前沿，立足广东省“智慧城市”行动、瞄准国家中长期发展规划在智能化信息处理和智能感知技术方面的重大战略目标、紧密结合企业市场的重大需求，凝聚方向、汇聚人才、科学创新、引导发展。实验室以自身在人工智能，计算智能，模式识别，机器学习，图像处理，多媒体信息处理，数据挖掘，无线传感器网络等领域的优势，重点开展计算智能算法，无线传感器网络优化与调度，云资源智能化调度，云数据智能处理，大数据建模优化，大数据分布式处理，分布式多媒体等基础理论与方法的研究。\r\n\r\n \r\n\r\n二、招聘岗位\r\n\r\n中山大学机器智能与先进计算教育部重点实验室主任1名；\r\n\r\n中山大学机器智能与先进计算教育部重点实验室副主任1名；\r\n\r\n三、应聘条件\r\n\r\n1.在实验室的主要研究领域有较高的学术造诣和国际学术影响；\r\n\r\n2.对实验室的近期、中长期发展有前瞻性发展设想和较具体的部署方案；\r\n\r\n3.具有较强的组织管理、协调能力和敬业精神；\r\n\r\n4.身体健康,年龄一般不超过五十五岁；\r\n\r\n5.是高等学校聘任的全职教学科研人员。\r\n\r\n四、招聘评审相关事项\r\n\r\n1.应聘者即日起可向中山大学数据科学与计算机学院报名，提交应聘申请报告，内容包括：\r\n\r\n(1)个人学术简历；\r\n\r\n(2)主要研究成果简述(500字以内)；\r\n\r\n(3)对实验室发展目标的设想和组织管理措施；\r\n\r\n(4)近五年来发表的学术论文和成果清单；\r\n\r\n(5)学历、学位证书复印件；\r\n\r\n(6)其他证明材料。\r\n\r\n2.报名截止时间：2016年6月15日。初审通过后，答辩时间另行通知。\r\n\r\n3.联系部门：中山大学数据科学与计算机学院\r\n\r\n联系人：李老师\r\n\r\nE-mail：sdcs@mail.sysu.edu.cn\r\n\r\n通讯地址：广州市大学城外环东路132号中山大学，邮编510006\r\n\r\n联系电话：020-39943563\r\n\r\n \r\n\r\n \r\n\r\n中山大学数据科学与计算机学院\r\n\r\n2016年5月31日', '0', '2017-03-04 13:24:47', '1', '/static/upload/article/test.png');
INSERT INTO `articles` VALUES ('21', '中山大学数据科学与计算机学院博士后招聘启事', '因科研工作需要，现面向国内外公开招聘中山大学数据科学与计算机学院博士后若干名，现将有关事项公布如下：\r\n\r\n一、招聘岗位详见下表\r\n\r\n邱道文\r\nDaowen Qiu\r\n计算机科学、计算机科学的基础理论\r\nComputer Science, FundamentalTheory of Computer Science\r\n量子计算与量子信息中或计算理论\r\nSome issues in quantum computing and quantum information\r\n\r\n马啸\r\nXiao Ma\r\n通信与信息系统\r\nCommunication and Information Systems\r\n无线通信、数字存储、信息理论、信道编码理论与技术\r\nwireless communications, digital storage, information theory, channel coding theory and technology\r\n\r\n张军\r\nJun Zhang\r\n计算机科学与技术\r\nCompu\\ter Science and Technolog\r\n高性能计算\r\nHigh Performance Computing\r\n\r\n印鉴\r\nYin Jian\r\n计算机科学与技术\r\nComputer Science and Technology\r\n大数据、数据挖掘\r\nBig Data and Data Mining\r\n\r\n余阳\r\nYang YU\r\n计算机软件与理论\r\nComputer Software and Theory\r\n社会工作流；云工作流；时态工作流\r\nSocial Workflow；\r\n\r\nCloud Workflow；\r\n\r\nTemporal Workflow。\r\n\r\n温武少\r\nWushao wen\r\n计算机科学与技术、软件工程\r\nComputer Science and Engineering\r\n大数据、数据挖掘\r\n\r\n云计算\r\nBig Data and Data Mining；Cloud Computing\r\n\r\n骆伟祺\r\nWeiqi Luo\r\n计算机科学与技术\r\nComputer Science & Technology\r\n多媒体信息取证\r\n\r\n多媒体信息隐写与隐写分析研究\r\nDigital multimedia Forensics\r\n\r\nDigital multimedia steganography and steganalysis\r\n\r\n李绿周\r\nLvzhou Li\r\n计算机科学\r\nComputer Science\r\n量子计算与量子信息\r\nquantum computation and quantum information\r\n\r\n郑子彬\r\nZibin Zheng\r\n计算机科学与技术\r\nComputer Science & Technology\r\n数据挖掘算法研究\r\n\r\n移动大数据的推荐算法研究\r\nThe research of data mining algorithms\r\n\r\nThe research of mobile big data recommendation algorithms.\r\n\r\n江颖\r\nYing Jiang\r\n计算数学\r\nComputational mathematics\r\n积分方程数值解\r\nNumerical solutions for integral equations\r\n\r\n谭志军\r\nZhijun Tan\r\n计算数学\r\nComputational mathematics\r\n1.  研究流体动边界问题的高精度快速算法、理论及其应用\r\nStudy fast algorithms with high accuracy for moving boundary problems in fluids ,theory and their applications\r\n\r\n二、博士后申请及审批流程\r\n\r\n申报以上博士后职位的流程详见中山大学人事处-博士后之家：http://rsc.sysu.edu.cn/PostDoctor/Article/ShowArticle.asp?ArticleID=494\r\n\r\n三、博士后进站申请材料\r\n\r\n申报以上博士后职位的申请材料详见中山大学人事处-博士后之家：\r\n\r\nhttp://rsc.sysu.edu.cn/PostDoctor/Article/ShowArticle.asp?ArticleID=1088\r\n\r\n四、应聘说明\r\n\r\n有意应聘者可与相关教授直接联系（联系方式见中山大学数据科学与计算机学院主页：http://sdcs.sysu.edu.cn/专职师资/ ），请将应聘材料电子版发送至相关教授的邮箱，或发送至学院联系人处（学院联系方式见下方）。邮箱主题请注明：应聘博士后。\r\n\r\n资料保密，恕不退还。学院按学校相关规定流程办理聘任手续。\r\n\r\n本招聘启事长期有效，竭诚欢迎青年学者与我院联系！\r\n\r\n联系人：李奈青\r\n\r\n联系地址：广州市大学城中山大学数据科学与计算机学院A116室\r\n\r\n邮政编码：510006\r\n\r\n联系电话：+86-20-39943563\r\n\r\n电子邮箱：schr @mail.sysu.edu.cn\r\n中山大学数据科学与计算机学院\r\n2015年11月10日', '3', '2017-03-04 13:25:35', '1', '/static/upload/article/test.png');

-- ----------------------------
-- Table structure for `cases`
-- ----------------------------
DROP TABLE IF EXISTS `cases`;
CREATE TABLE `cases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `icon` varchar(64) NOT NULL,
  `tag` varchar(256) DEFAULT NULL,
  `introduction` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cases
-- ----------------------------
INSERT INTO `cases` VALUES ('16', '大数据智能分析', 'Fire dynamics simulator(FDS) 是一款用于处理火灾驱动的流体流动的开源计算流体力学CFD软件，广泛应用于建筑设计和消防安全等工程领域。FDS软件采用三维大涡模拟（Large Eddy Simulation），通过求解NS方程来分析燃烧过程中建筑内的温度场和流场的变化，但在此案例中，我们并不需要去关心具体求解过程。FDS软件支持MPI / OMP 的并行计算 , 但截止我们测试时，其公开版本（6.3.0）对MPI 并行计算有诸多限制:MPI 进程数必须少于其输入文件中的网格区域（MESH）数，并按照“前面的每个进程处理一个网格区域，最后一个进程处理剩余所有的网格区域”的方式来进行计算。这种模式使得FDS在HPC环境下直接使用难以发挥高性能计算集群的性能优势。\r\n\r\n![](/static/upload/md_images/20170304132855.png)\r\n\r\n![](/static/upload/md_images/20170308114305.png)\r\n\r\n为了能够在高性能计算环境下发挥FDS的并行计算能力，用户需要将模型切割成不同的MESH块。但一般情况下，用户建模是根据求解问题的几何特性来创建输入文件的MESH。这种建模方式导致了输入方式的各个MESH块中实际网格数量相差较大。\r\n\r\n为了能够使FDS的算例在超算上使用更大的节点规模，需要将大的MESH块拆分成小的MESH 块。通过拆分，可以提高MESH块的数量，从而提高算例的可用进程数，同时也降低了负载的不均衡性。此案例即要求用户尝试不同的切分方案来了解负载均衡对并行计算效率的影响。\r\n\r\n![](/static/upload/md_images/20170304132934.png)', '/static/upload/case/16.png', '', '为了能够使FDS的算例在超算上使用更大的节点规模，需要将大的MESH块拆分成小的MESH 块。通过拆分，可以提高MESH块的数量，从而提高算例的可用进程数，同时也降低了负载的不均衡性');
INSERT INTO `cases` VALUES ('17', '云计算', 'Jacobi迭代是一种比较常见的迭代方法，具体来说，Jacobi迭代得到的新值是原来旧值点相邻数值点的平均。Jacobi迭代的局部性很好，可以取得很高的并行性，是并行计算中常见的一个例子。将参加迭代的数据按块分割后，各块之间除了相邻的元素需要通信外，在各块的内部可以完全独立地并行计算。随着计算规模的扩大，通信的开销相对于计算来说比例会降低，这将更有利于提高并行效果。Jacobi迭代的伪代码如下所示。\r\n\r\n```\r\nREAL A(N+1,N+1), B(N+1,N+1)\r\n\r\nDO K=1,STEP\r\n    DO J=1,N\r\n        DO I=1,N\r\n            B(I,J)=0.25*(A(I-1,J)+A(I+1,J)+A(I,J+1)+A(I,J-1))\r\n        END DO\r\n    END DO\r\n\r\n    DO J=1,N\r\n        DO I=1,N\r\n            A(I,J)=B(I,J)\r\n        END DO\r\n    END DO\r\nEND DO\r\n```\r\n为了并行求解Jacobi迭代，这里将参加迭代的数据按列进行分割，并假设一共有4个进程同时并行计算。数据的分割结果如下图所示。\r\n\r\n![](/static/upload/md_images/20170304133038.png)\r\n\r\n假设需要迭代的数据是M*M的二维数组A(M,M)，令M=4N，按下图所示进行数据划分，则分布在四个不同进程上的数据分别是： 进程0，A(M,1:N)、 进程1， A(M,N+1:2N)、进程2，A(M,2N+1:3N)、进程3，A(M,3N+1:M)。由于在迭代过程中，边界点新值的计算需要相邻边界其它块的数据，因此在每一个数据块的两侧又各增加1列的数据空间，用于存放从相邻数据块通信得到的数据 这样原来每个数据块的大小从MN扩大到M N+2，进程0和进程1的数据块只需扩大一块即可满足通信的要求，但这里为了编程的方便和形式的一致，在两边都增加了数据块。\r\n\r\n计算和通信过程是这样的，首先对数组赋初值，边界赋为8，内部赋为0，注意对不同的进程，赋值方式是不同的（两个内部块相同 但内部块和两个外部块两两互不相同）。然后，便开始进行Jacobi迭代，在迭代之前，每个进程都需要从相邻的进程得到数据块。同时，每一个进程也都需要向相邻的进程提供数据块（如下图所示）。由于每一个新迭代点的值是由相邻点的旧值得到，所以这里引入一个中间数组用来记录临时得到的新值，一次迭代完成后，再统一进行更新操作。', '/static/upload/case/17.png', '', '云计算[1]  （cloud computing）是基于互联网的相关服务的增加、使用和交付模式，通常涉及通过互联网来提供动态易扩展且经常是虚拟化的资源。');
INSERT INTO `cases` VALUES ('18', '人工智能', '在科学与工程计算的许多问题中， 矩阵乘积是最基本的算法之一。经典的分布式矩阵乘积算法主要有1969年Cannon提出的二维mesh上的矩阵乘积算法和1987年Fox等提出的“广播-乘积-滚动”算法。1994年Choi等提出的PUMMA 算法将Fox 算法推广到二维块卷帘数据分布上。同年，Huss-Lederman等又将Fox算法推广到虚二维环绕数据分布。1995年van de Geijn 和Watts提出了一个简单而高效的矩阵乘积算法， 称为SUMMA 算法。\r\n\r\nSUMMA 算法首先将A, B和C划分为相同大小的矩阵，对应放在mesh_r × mesh_c的二维mesh上。但SUMMA 算法将矩阵乘法分解为一系列的秩nb 修正, 即各处理器中的A和B 分别被分解为nb 大小的列块和行块进行相乘，前面所说的分块尺寸就是指nb 的大小。算法中, 广播实现为逻辑处理器行环或列环上的流水线传送, 达到了计算与通信的重叠. 具体描述如下伪代码所示。\r\n\r\n```\r\nC= 0\r\nfor i= 0 t o k-1 step nb do\r\n　cur col = i×c/ n\r\n　cur row = i×r / m\r\n　if my col = cur rol 向本行广播A 从i mod (k/c) 列开始的nb 列, 存于A′\r\n　if my row = cur row 向本列广播B 从i mod (k/r) 行开始的nb 行, 存于B ′\r\n　C= A′×B ′\r\nend for\r\n```\r\n\r\nSUMMA算法的核心思想是：各处理器收集来自同一行处理器中A矩阵子块的所有列和同一列处理器中B矩阵子块的所有行，然后将行列相乘后累加，形成一个C矩阵的分块矩阵。最后由rank=0的处理器将其他处理器的数据收集起来，形成最终的矩阵C。SUMMA算法相较于cannon算法的优势只要体现在SUMMA算法能够计算ml的A矩阵和ln的B矩阵相乘（m、l、n可不相等），而cannon算法只能实现nn的A矩阵和nn的B矩阵相乘，具有很大的局限性。', '/static/upload/case/18.png', '', 'SUMMA 算法首先将A, B和C划分为相同大小的矩阵，对应放在mesh_r × mesh_c的二维mesh上。但SUMMA 算法将矩阵乘法分解为一系列的秩nb修正.  ');
INSERT INTO `cases` VALUES ('19', '区块链', '区块链（Blockchain）是比特币的一个重要概念，火币联合清华大学五道口金融学院互联网金融实验室、新浪科技发布的《2014—2016全球比特币发展研究报告》提到区块链是比特币的底层技术和基础架构[3]  。本质上是一个去中心化的数据库，同时作为比特币的底层技术。区块链是一串使用密码学方法相关联产生的数据块，每一个数据块中包含了一次比特币网络交易的信息，用于验证其信息的有效性（防伪）和生成下一个区块。\r\n\r\n狭义来讲，区块链是一种按照时间顺序将数据区块以顺序相连的方式组合成的一 种链式数据结构， 并以密码学方式保证的不可篡改和不可伪造的分布式账本。广义来讲，区块链技术是利用块链式数据结构来验证与存储数据、利用分布式节点共识算法来生成和更新数据、利用密码学的方式保证数据传输和访问的安全、利用由自动化脚本代码组成的智能合约来编程和操作数 据的一种全新的分布式基础架构与计算范式。', '/static/upload/case/19.png', '', '区块链是分布式数据存储、点对点传输、共识机制、加密算法等计算机技术的 新型应用模式。所谓共识机制是区块链系统中实现不同节点之间建立信任、获取权益的数学算法');
INSERT INTO `cases` VALUES ('20', '高性能计算', '高性能计算(High performance computing， 缩写HPC) 指通常使用很多处理器（作为单个机器的一部分）或者某一集群中组织的几台计算机（作为单个计 算资源操作）的计算系统和环境。有许多类型的HPC 系统，其范围从标准计算机的大型集群，到高度专用的硬件。大多数基于集群的HPC系统使用高性能网络互连，比如那些来自 InfiniBand 或 Myrinet 的网络互连。基本的网络拓扑和组织可以使用一个简单的总线拓扑，在性能很高的环境中，网状网络系统在主机之间提供较短的潜伏期，所以可改善总体网络性能和传输速率。', '/static/upload/case/20.png', '', '高性能计算指通常使用很多处理器（作为单个机器的一部分）或者某一集群中组织的几台计算机（作为单个计 算资源操作）的计算系统和环境。 ');
INSERT INTO `cases` VALUES ('21', '软件定义网络', '软件定义网络（Software Defined Network, SDN ），是Emulex网络一种新型网络创新架构，是网络虚拟化的一种实现方式，其核心技术OpenFlow通过将网络设备控制面与数据面分离开来，从而实现了网络流量的灵活控制，使网络作为管道变得更加智能。', '/static/upload/case/21.png', '', '软件定义网络（Software Defined Network, SDN ），是Emulex网络一种新型网络创新架构，是网络虚拟化的一种实现方式。');

-- ----------------------------
-- Table structure for `conferences`
-- ----------------------------
DROP TABLE IF EXISTS `conferences`;
CREATE TABLE `conferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `introduction` varchar(256) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `conferences_ibfk_1` (`user_id`),
  CONSTRAINT `conferences_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of conferences
-- ----------------------------
INSERT INTO `conferences` VALUES ('1', '3', '师兄1', '110', '预约测试1', '2017-03-02 21:24:00', '2017-03-02 21:50:00');
INSERT INTO `conferences` VALUES ('2', '3', '师兄2', '110', '预约测试2', '2017-03-02 12:00:00', '2017-03-02 14:00:00');
INSERT INTO `conferences` VALUES ('3', '3', '师兄3', '110', '预约测试3', '2017-03-03 13:00:00', '2017-03-03 14:15:00');
INSERT INTO `conferences` VALUES ('4', '4', '师兄4', '110', '预约测试4', '2017-03-03 14:15:00', '2017-03-03 14:35:00');
INSERT INTO `conferences` VALUES ('5', '5', '师兄5', '110', '预约测试5', '2017-03-03 14:45:00', '2017-03-03 15:25:00');
INSERT INTO `conferences` VALUES ('6', '4', '师兄6', '110', '预约测试6', '2017-03-04 14:15:00', '2017-03-04 15:25:00');
INSERT INTO `conferences` VALUES ('8', '5', '师兄8', '110', '预约测试8，这是预约测试8，没错是预约测试8，为什么我在说一些废话', '2017-03-06 08:30:00', '2017-03-06 15:25:00');
INSERT INTO `conferences` VALUES ('9', '5', '师兄9', '110', '预约测试9', '2017-03-07 14:45:00', '2017-03-07 15:55:00');
INSERT INTO `conferences` VALUES ('10', '5', '师兄10', '110', '预约测试10', '2017-03-08 17:45:00', '2017-03-08 19:25:00');
INSERT INTO `conferences` VALUES ('12', '6', '吴迪', '1325423423', '学术报告', '2017-03-10 11:00:00', '2017-03-10 16:30:00');
INSERT INTO `conferences` VALUES ('13', '3', '12', '12', '12', '2017-03-08 08:30:00', '2017-03-08 11:00:00');
INSERT INTO `conferences` VALUES ('14', '3', '33', '33', '33', '2017-03-08 07:20:00', '2017-03-08 08:30:00');

-- ----------------------------
-- Table structure for `members`
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `icon` varchar(64) NOT NULL,
  `web_index` varchar(128) DEFAULT NULL,
  `description` varchar(64) DEFAULT NULL,
  `rank` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of members
-- ----------------------------
INSERT INTO `members` VALUES ('4', '所长：吴迪教授', '/static/upload/team\\4.png', 'http://sdcs.sysu.edu.cn/node/2525', null, '0');
INSERT INTO `members` VALUES ('5', '副所长：卓汉逵副教授', '/static/upload/team\\5.png', 'http://sdcs.sysu.edu.cn/node/2561', null, '0');
INSERT INTO `members` VALUES ('6', '林小拉教授', '/static/upload/team\\6.png', 'http://sdcs.sysu.edu.cn/node/2506', 'None', '1');
INSERT INTO `members` VALUES ('7', '陈旭教授', '/static/upload/team\\6.png', 'http://sdcs.sysu.edu.cn/node/2497', null, '1');
INSERT INTO `members` VALUES ('8', '沈鸿教授', '/static/upload/team/test.png', 'http://sdcs.sysu.edu.cn/node/2459', null, '1');
INSERT INTO `members` VALUES ('9', '温武少教授', '/static/upload/team/test.png', 'http://sdcs.sysu.edu.cn/node/2524', null, '1');
INSERT INTO `members` VALUES ('10', '吴维刚教授', '/static/upload/team\\10.png', 'http://sdcs.sysu.edu.cn/node/2492', null, '1');
INSERT INTO `members` VALUES ('11', '李才伟副教授', '/static/upload/team/test.png', 'http://sdcs.sysu.edu.cn/node/2501', null, '2');
INSERT INTO `members` VALUES ('12', '刘聪副教授', '/static/upload/team\\12.png', 'http://sdcs.sysu.edu.cn/node/2543', null, '2');
INSERT INTO `members` VALUES ('13', '潘嵘副教授', '/static/upload/team/13.png', 'http://sdcs.sysu.edu.cn/node/2546', null, '2');
INSERT INTO `members` VALUES ('14', '桑应朋副教授', '/static/upload/team\\14.png', 'http://sdcs.sysu.edu.cn/node/2474', null, '2');
INSERT INTO `members` VALUES ('15', '吴贺俊副教授', '/static/upload/team/test.png', 'http://sdcs.sysu.edu.cn/node/2554', null, '2');
INSERT INTO `members` VALUES ('16', '张治国副教授', '/static/upload/team/test.png', 'http://sdcs.sysu.edu.cn/node/2558', null, '2');
INSERT INTO `members` VALUES ('17', '周杰英副教授', '/static/upload/team/test.png', 'http://sdcs.sysu.edu.cn/node/2698', null, '2');
INSERT INTO `members` VALUES ('18', '张永民', '/static/upload/team/test.png', 'http://sdcs.sysu.edu.cn/node/2564', null, '3');
INSERT INTO `members` VALUES ('19', '轩辕哲', '/static/upload/team/test.png', 'http://sdcs.sysu.edu.cn/node/2577', null, '3');
INSERT INTO `members` VALUES ('20', '杨晓杏', '/static/upload/team/test.png', 'http://sdcs.sysu.edu.cn/personnel/teachers', null, '4');
INSERT INTO `members` VALUES ('21', '易娟', '/static/upload/team/test.png', 'http://sdcs.sysu.edu.cn/personnel/teachers', null, '4');
INSERT INTO `members` VALUES ('22', '朱慧灵', '/static/upload/team/test.png', 'http://sdcs.sysu.edu.cn/personnel/teachers', null, '4');

-- ----------------------------
-- Table structure for `papers`
-- ----------------------------
DROP TABLE IF EXISTS `papers`;
CREATE TABLE `papers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(512) NOT NULL,
  `information` varchar(256) NOT NULL,
  `url` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of papers
-- ----------------------------
INSERT INTO `papers` VALUES ('4', 'HELOS: Heterogeneous Load Scheduling for Electric Vehicle-integrated Microgrids', 'Gaoxiang Li*, Di Wu, Jiefeng Hu, Yong Li, M. Shamim Hossain and Ahmed Ghoneim. In IEEE Transactions on Vehicular Technology (IEEE TVT), In press, 2017.', null);
INSERT INTO `papers` VALUES ('5', 'Cache Behavior Characterization and Validation over Large-scale Video Data', 'Jiaqiang Liu, Huan Yan, Yong Li, Di Wu, Li Su and Depeng Jin. In IEEE Transactions on Circuits and Systems for Video Technology (IEEE TCSVT), In press, 2017.', null);
INSERT INTO `papers` VALUES ('6', 'Opportunistic Task Scheduling over Co-Located Clouds in Mobile Environment', 'Min Chen, Yixue Hao, Di Wu, Yong Li, Kai Hwang. In IEEE Transactions on Services Computing (IEEE TSC), In press, 2017.', null);
INSERT INTO `papers` VALUES ('7', 'Online Cloud Transcoding and Distribution for Crowdsourced Live Game Video Streaming', 'Yuanhuan Zheng, Di Wu, Yihao Ke, Can Yang, Min Chen, and Guoqing Zhang. In IEEE Transactions on Circuits and Systems for Video Technology (IEEE TCSVT), In press, 2017. (Corresponding Author)', null);
INSERT INTO `papers` VALUES ('8', 'Measuring and Analyzing Third-party Mobile Game App Stores in China', 'Tingting Wang, Di Wu, Jiaming Zhang, Min Chen, Yipeng Zhou, In IEEE Transactions on Network and Service Management (IEEE TNSM), Volume 13, Issue 4, pages 793-805, Dec. 2016. (Corresponding Author)', null);

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `password_hash` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `is_password_reset_link_valid` tinyint(1) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `date_joined` datetime DEFAULT NULL,
  `permissions` int(11) NOT NULL,
  `avatar_url` varchar(128) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_users_email` (`email`),
  UNIQUE KEY `ix_users_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('3', 'zouzhp', 'pbkdf2:sha1:1000$GFC8NICs$4b1da36d48f5a4493779d8f58847d46aa1b8c50e', '5039@qq.com', '1', '2017-02-28 20:45:34', '2017-02-27 19:12:44', '0', 'http://www.gravatar.com/avatar/', null);
INSERT INTO `users` VALUES ('4', 'test1', 'pbkdf2:sha1:1000$uHnWzH2d$11972b89923b31a00a05141074376a2bd6aa0586', 'test1@qq.com', '1', '2017-03-07 21:17:43', '2017-03-02 18:32:05', '1', 'http://www.gravatar.com/avatar/', null);
INSERT INTO `users` VALUES ('5', 'test2', 'pbkdf2:sha1:1000$xBBHxzms$bbdf679cebb937dec5f3eb405cf129c1f2ebf6ff', 'test2@qq.com', '1', '2017-03-02 18:32:29', '2017-03-02 18:32:29', '1', 'http://www.gravatar.com/avatar/', null);
INSERT INTO `users` VALUES ('6', 'admin', 'pbkdf2:sha1:1000$diU25qi5$f475723008bca81e5cafeb7056c965d3c089ac94', 'admin@qq.com', '1', '2017-03-08 11:41:55', '2017-03-04 13:48:04', '0', '6.png?t=1488617985.29', '233333');
