# XDomain DesignDraft


## XDomain 的产品架构

![img](./img/bill-flow.png)


### XDomain在具体的业务应用和数据存储之间通过进行分层抽象

1.  **单据数据流** 是外围系统的业务单据流

    -   单据分散在不同的业务系统中

2.  **业务Bean** 是具体业务中特化的领域对象

    -   **业务Bean** 可能会包含一个或者多个子域Bean 对象
    -   **业务Bean** 会有自己的业务属性

3.  **子域Bean** 是XDomain中具体的子域对象

    -   **子域Domain** 概念之间是没有交集的, 即不应该出现同一个概念在两个子域Domain 中都存在
    -   不应该包含业务具体的属性信息

4.  **数据Bean** 是XDomain最终存储在DB中的对象

    -   这里的不特指具体的数据存储类型, 可以是mongo等NoSQL或者MySQL等SQL
    
    -   数据存储承载着来自 **子域Bean** 和 **业务Bean** 的业务特性的要求
        -   版本历史记录


## 应用 与 XDomain 之间的关系

![img](./img/arch-overall.png)

XDomain 将单据存储到了多个子域中, 对外提供接口, 这些接口并不能直接被最上层的应用调用,

-   从技术视角来看, 每个应用处理自己的业务逻辑, 负责整个系统的某个切面

-   从单据的视角来看, 这些应用可看做长在 XDomain 的数据之上的负责具体某个具体事务的应用, 包含,


### 单据导入导出


### 单据对账

  - [单据对账的用户故事](https://wiki.xforceplus.com/display/ECCP/[ECCP][BillChecking]++UserStory)


### 折扣池

