//
//  ProblemViewController.m
//  ShangTest
//
//  Created by mac on 16/8/26.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "ProblemViewController.h"
#import "ProblemTableViewCell.h"

@interface ProblemViewController ()

@property(nonatomic,strong)NSArray *array;

@property(nonatomic,strong)NSArray *answerArray;

@property(nonatomic,assign)NSInteger selectSection;

@property(nonatomic,strong)UITableView *table;

@end

@implementation ProblemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor colorWithRed:0.95 green:0.93 blue:0.93 alpha:1];
    self.selectSection = -1;
    self.array = @[@"为什么有视频还要花钱参加你们培训？",@"培训还是自学？到底该怎么选？",@"很多人说培训不如自学，自学的扎实，是不是这样？",@"实习怎么样？我觉得我什么都不会，需要实习。",@"我已经掌握完整的技术体系，能不能去实习？",@"为什么企业不愿意培养零基础的新人？",@"每次课后都有作业吗？作业多吗？ 会不会很辛苦？",@"有的机构总频繁的换老师，你们会不会换老师？",@"课程内容这么多，都能学完吗？",@"如果学了一部分跟不上怎么办？",@"怎么检测和保证我的学习效果？效果如何体现？",@"我基础很好，只想学中级和高级？",@"你们的课程时间是如何安排的？",@"机房是全天开着的吗？",@"节假日可以去学习吗？",@"你们教室能保持安静吗，能保证学生上课不受影响吗？",@"老师每次上课时间是固定的吗，会随时调整吗？",@"学习期间中途有事儿，可以请假吗？落下课程怎么补",@"报名之后还能再退吗？",@"能试听吗？",@"学不会，还可以全额退款吗？",@"我不确定选什么专业，哪个专业薪资高，有推荐吗？",@"项目的源码会给我们吗？",@"刚开始学习就会做项目吗？",@"我现在没钱，花销大，打算先赚钱，之后再过来学？",@"进入软件行业都要系统培训，我想以后再报名，不着急",@"在尚学堂学完有什么证书吗？",@"尚学堂包就业吗？",@"女孩学编程好就业吗？",@"女孩学开发太累了，不想学，想学测试？"];
    
    self.answerArray = @[@"  为什么有书本我们还要上大学呀？书本和视频是传播技术非常好的手段，但是参加培训面试仍然是最佳的捷径。参加培训最大的好处就是系统、快速的获得所需技能，它的效率是看视频的5倍以上，看书的20倍以上。也就是说，4个月系统的训练，如果你要看视频自学至少需要2年的时间。\n  1.节省大量时间，这些时间可以用于工作赚钱。培训毕竟有老师亲自辅导和讲解，实战化的教学，会让你学习的效率大大提高。同样自学你需要花6个月，有老师指导只需要1个月，你把省下的时间去赚钱, 是不是更划算。\n  2.积累同学，积累人脉，就像中学同学、大学同学对你人生的意义那样。培训可以积累丰富的人脉，为以后发展打下基础。大牛的老师，几十个一起学习的同学。就像你们初中同学、高中同学、大学同学，最后都能在你人生的发展中起到很大的作用。如上两点优势，看视频都无法给你！",@"  系统培训的好处？自学的好处？\n  培训的本质好处：让你在短时间内掌握企业项目开发技能，积累人脉同学圈。\n  自学的好处：不交学费，但是浪费时间。\n  这个模型是我们综合很多学员实际情况而得出的。前6个月，培训的学员只有支出没有收入，一直是负值；就业后，收入开始增加，到10个月的时候，已经将所有学费和培训期生活费赚回来了，实现了“投资的持平”。10个月后，开始大规模的超越自学学员的收入，而且差距是渐渐拉大而不是缩小。两年后，两个人的差距就非常明显了。参加培训后，正常上班涨薪水的学员，两年后可以攒到15.8万元，积累两年工作经验。而自学的朋友，仍然在纠结学什么的问题、怎么学的问题，当然，正常工作也有收入4.2万元，也算小有成绩，但是已经明显落后。\n  培训的本质好处始终是“高效率，节省时间，短时间拔高薪水，让你用省出的时间去赚钱；同时，还积累了相当多的“老师和同学”的人脉。",@"  这是一种常见的误解。同样是学习，培训期间每天学习十多个小时，而且又有老师辅导和同学交流，这么大的量，自学一般需要至少两年时间。如果你能用两年时间自学完这四个月的课程(前提是你要能自学完)，确实可能要比培训四个月刚出来强一些。但是，别忘了，你多花了1年半的时间，这时候培训完的学员早已经又工作一年半了。自学两年有可能会比培训四个月强一些(这种可能性其实也极低)，但是肯定比“培训四个月，工作1年半”差很多，很多，很多！！！",@"  什么职位适合边实习边学习？一般是门槛比较低的行业，你可以很快胜任。比如：销售类的工作。技术类门槛比较高的一般不喜欢实习，培养周期太长，成本太高。大企业喜欢招实习生，人家的实习生一般也是要求名校毕业，愿意花成本培养。当然，清华北大毕业的学生一般都去实习，是因为大公司愿意花成本培养这些学生。对于绝大多数中小企业来说，招聘技术类的人员， 喜欢直接能上手工作的人。一个实习生过来实习研发，如果这个人没有系统的知识体系，培养起来非常难。还需要搭一个管理人员盯着实习生，培养成本极高。 而且，就算企业要你实习。带你的人也不可能手把手教你，所以你提高有限。毕竟他自己也有很多工作要做，你一天问他一个问题，他都觉得烦，如果你问多了，他自己的活要不要干了？这样耽误几个月时间，实习半年，通常收获也很少，除非是悟性和自学能力非常一流的人。倒不如，压下心来，全心全意培训四个月，时间耽误的少，直接找工作，来得痛快。立刻上班，企业也喜欢立刻可以上手的人。",@"  这个时候，没有任何问题。我们的学员毕业后，也有到京东、阿里巴巴、华为、新浪、搜狐这些公司实习的。虽然，实习待遇非常低。但，我们通常会鼓励去。毕竟，对于刚入职场的新人，赚钱其实不是第一位的，更重要的是学东西、攒经验值。",@"  只能怪现在社会太浮躁。很多中小企业花成本培养新人，最后的结果往往是新人刚刚上手，就开始叫板公司涨薪，不然跳槽。完全无视公司对自己的培养成本。只能怪中国人才太多，过剩。有经验的一大把，为什么招聘什么都不会的\"生瓜蛋子\"",@"  是的，如果你害怕辛苦，可以考虑不来尚学堂。 每天都有超多的作业，这些作业都是贴近实战的作业。需要你晚自习参考老师上课讲的内容，查询相关资料完成。很多学生经常要学习到晚上23点、甚至凌晨2，3点。",@"  整个4个月下来，会有4-5位老师教大家。换老师肯定会，但凡事得有度，不能太频繁。有的机构由于是聘请的兼职老师，有时候兼职老师有事来不了，就频繁的换老师，甚至达到了1周换一个，严重影响教学质量。",@"  首先，很遗憾的告诉你，不要期待全部掌握尚学堂的课程，除非你能力奇强。大部分同学能消化60%就能实现就业，如果你能掌握80%那就非常牛了。我们设置这么多的课程，是以“清华”的高标准要求大家，学员一路走来以最高标准要求自己，即使最终达不到“清华水平”，“普通211”也是没有问题的。(只是比喻，没有不敬之意，来尚学堂学习的清华学子见谅)。",@"  学的辛苦是肯定的，你要做好心理准备。如果实在跟不上，可以免费留级再学。一般，留级多学一个月就没问题了。比较极端的学员，去年几千人里只有几个人多学了2个月，也学会就业了。",@"  其实，我希望你来我们这里学习，也能认可我们“实战化”的理念。你抱着“实战化”的理念去学习，也要抱着“实战化”的理念检验自己学习情况。能写程序、能做项目，就是学习效果的直接体现。",@"  其实基础还是很重要的。以后出去找工作，很多笔试题都是基础题目。如果你不是特别特别好，建议还是从基础开始系统学一下，就差个把月的时间。当然，确实特好，可以插班学习中级和高级。",@"  上午9点到12点授课。下午2点到6点。晚自习是7点到9点。晚自习也需要大家都在。",@"  是的。不过，一般学到晚上21点差不多了。回家洗洗就可以休息了，为第二天的战斗养好精神。",@"  可以。节假日机房也是开放的。",@"  教室都安了隔音装置，都有隔音棉。放心，没问题的。",@"  我们这都是全职老师，上课时间是固定的。不会像有的很多机构那样乱调整上课时间。",@"  可以请假。而且，是必须请假的。落下的课程你可以申请免费留级，重学一遍。",@"可以退。没问题。",@"  能，可以试听。我们对自己的教学完全有信心。",@"  如果是我们没有开课，是我们的问题，可以退款。如果是学员个人问题，不好好学习，不能退款。",@"  目前，尚学堂开设的专业都是最热门的专业，每个专业都可以赚的很多。这个问题就像问：”篮球明星赚得多还是足球明星赚得多？“。其实， 关键是你学的怎么样，而不是专业的问题。大家选择专业还是按照自己的兴趣来。尚学堂的专业都可以选择，如果不是热门专业，没有前景，我们都不会开设。",@"  教学中的源码会给学员。但是企业的商业源码我们不能给，很多源码都是企业花了几百万、几千万开发的。如果发生泄密，公司和学员都担不起这么大的法律责任。当然，部分商业源码我们和企业签订了相关协议的，可以给大家。",@"  刚开始，由于学员水平基础，不可能一开始直接做项目。尚学堂很神，但还没那么神。但，我们会让学员开始接触项目，让大家了解企业管理的部分流程。后期开发相关项目，更容易上手。这也是尚学堂不同于其他培训机构的地方，我们所有细节上，都强调“实战化”、尽量“实战化”。让大家面试、上班更“顺畅丝滑”。",@"  其实，这是典型的“穷人思维”。其实没钱的本质是挣得少。你挣得少的本质是脑袋里没货。脑袋里有货的话，现在这个社会挣钱，轻轻松松奔小康还是很容易的。所以，你更应该思考如何更快的让自己“充电”，让自己拿高薪。而不是”更慢的等待”。30年后，扫大街都可以拿到月薪3万，那又有什么意义呢？",@"  可以以后报名，但是越早报名越划算，而且报名费可以全额退还。我们的规则就是：学费按照报名当月的政策走。所以，越早报名越划算，跟买机票是一个道理，越早买越划算。同时，报名费是会从学费中抵扣的。如果你以后不想学，可以提前说明，报名费也可以全额退。",@"  为什么需要证书？如果进入公务员等职业，证书有些用处。但是，如果进入企业一线实战，企业更加注重的是能力、开发能力。现在本科毕业证都一大把，一般的证书企业不看重了。企业现在就是看中你的能力，能不能做项目，能不能给他们带来更多的价值。不过，我们现在内部有技能证书，是需要实打实考的，不能混的哦，对于我们合作企业招聘那边是有分量的。",@"  很遗憾，我们不包，我们专注于提供最好的课程、最实战化的项目，不做不切实际的承诺。承诺无条件包就业的机构，往往都是带有欺骗性质的。就业永远是学员自己的事情，拯救自己的永远是你自己。尚学堂会提供协助帮助学员实现正常的就业。 从统计学角度看，任何一个人总是会就业的，即使不来培训。但是，就业也有质量差异，大学毕业做保安也可以算做就业。所以，大家担心自己无法就业，其实是杞人忧天，想多了。大家更多的想的应该是 “好好学习，学到过硬的真本事，实现高质量的就业”。希望你来到尚学堂后，依托尚学堂的资源更好的提升自己，让自己有较大的提升，千万不要态度消极，不好好学习、不积极就业，做”烂泥扶不上墙的阿斗“，那样谁都拯救不了你，尚学堂也救不了。 尚学堂可以通过各种就业服务来协助大家就业，只要平时正常学习、技术过关的学员，就业时候态度积极的学员，那就不是就业不就业的问题，而是有多快、薪水有多高的问题。",@"  女孩学编程就业或是不错的。很多企业的开发工作不需要出差，就特别喜欢招女孩子。第一、女孩子工作细心、稳定；第二、也可以调节工作气氛，俗话说“男女搭配，干活不累”。",@"  测试分为：黑盒测试、白盒测试。\n  白盒测试(高端测试工作，需要会写代码，有开发经验最好)：是通过程序的源代码进行测试而不使用用户界面。这种类型的测试需要从代码句法发现内部代码在算法，溢出，路径，条件等等中的缺点或者错误，进而加以修正。\n  黑盒测试(功能测试，最简单最底层的工作，高中毕业就能干的工作)：是通过使用整个软件或某种软件功能来严格地测试, 而并没有通过检查程序的源代码或者很清楚地了解该软件的源代码程序具体是怎样设计的。\n   尚学堂很多女学员毕业后，干一年后，想轻松点，都转去做高级测试工程师了，月薪都在15k以上。 如果你不会开发，只能做最简单的测试工作，待遇很低，也没有发展空间。 建议：现在你还年轻，是学习的时间，可以打下人生的基础。学了开发，做一年开发虽然辛苦，但是转型到白盒测试就非常好了，待遇高，也轻松。很适合女孩子。"];
    
    [self initSubviewLayout];
}

-(void)initSubviewLayout
{
    self.table = [[UITableView alloc]initWithFrame:CGRectMake(0, 69, SCREEN_WIDTH, SCREEN_HEIGHT -69)];
    [self.view addSubview:_table];
    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    _table.dataSource = self;
    _table.delegate = self;
    _table.rowHeight = UITableViewAutomaticDimension;
    _table.estimatedRowHeight = 60;
    _table.backgroundColor = self.view.backgroundColor;
    _table.allowsSelection = NO;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _array.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_selectSection == section) {
        return 1;
    }
    return 0;
}



-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProblemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ProblemTableViewCell" owner:nil options:nil]firstObject];
        cell.content.layer.cornerRadius = 5;
        cell.content.layer.masksToBounds = YES;
    }
    
    cell.content.text = _answerArray[_selectSection];
    
    return cell;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]init];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, SCREEN_WIDTH-20,1000 )];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.cornerRadius = 5;
    view.layer.masksToBounds = YES;
    
    [view addSubview:label];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.text = [NSString stringWithFormat:@"%ld.%@",section+1,_array[section]];
    [label sizeToFit];
    
    view.frame = CGRectMake(5, 5,SCREEN_WIDTH-10 , label.frame.size.height+10);
    
    
    
    
    
    UIView *v = [[UIView alloc]init];
    [v addSubview:view];
    v.backgroundColor = self.view.backgroundColor;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapSection:)];
    v.tag = section;
    [v addGestureRecognizer:tap];
    
    return v;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, SCREEN_WIDTH-20,1000 )];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.text = [NSString stringWithFormat:@"%ld.%@",section+1,_array[section]];
    [label sizeToFit ];
    return label.frame.size.height+20;
}

-(void)tapSection:(UITapGestureRecognizer*)tap
{
    if (_selectSection == tap.view.tag) {
        _selectSection = -1;
        [self.table reloadData];
    }else
    {
        _selectSection = tap.view.tag;
        
        [self.table reloadData];
        
        [self.table layoutIfNeeded];
        
        [self.table scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:_selectSection] atScrollPosition:(UITableViewScrollPositionTop) animated:YES];

    }
    
}

@end
