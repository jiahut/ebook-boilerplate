# XDomain UserStory

## XDomain 针对分散在不同业务系统的单据的数据流进行抽象, 并提炼出子领域模型

-   所有子域模型围绕单据进行展开, 所以我们抽象的时候只描述子域模型与单据之间的关系

-   每个子域概念上是正交的, 即理论上子域与子域之间是可以自由组合的
    -   真实世界中组合需要放到具体的场景下才有意义, 也不能随意的组合


## 假设XDomain已经具备了如上的抽象后, 相应的用户故事是,


### 对于单据系统的应用来讲,

-   能够低成本快速扩展出处理不同业务单据的能力
    -   这里低成本指的是能快速的满足业务需求
        -   一种可能的实现方式是通过 "低代码" 来实现
    -   扩展包括两个方面
        -   真实世界中不同的场景下的单据是将XDomain子域进行组合成具体业务模型对外提供出来的
        -   XDomain的子域不可能包含所有真实世界的属性, 即需要非常方便的扩展出新的字段

-   对单据进行统一的管理
    -   统一管理单据的创建, 查询, 状态
    -   单据的变更状态


### 对于XDomain的系统管理员来讲,

-   能够支持低成本的扩展子域的能力
    -   这里的低成本指的是变更 (包含新增?) 一个子域是动态的, 平滑的
        -   动态的意思是, 变更子域应该尽可能的通过配置, 而不应该重新开发
            -   定制的需求可以通过插件加载的方式实现
        -   平滑的指的是,上线后可以无需停机进行更新 ( 待商榷 ?)

-   输出XDomain的产品/技术文档
    -   最终目标XDomain 的一个解决单据业务流程的标准和技术产品, 包含,
        -   如何快速部署一套环境
        -   单据应用怎么快速的接入

