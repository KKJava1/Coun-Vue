<template>
  <div style="height: 110vh;min-width: 1660px">
    <a-row>
      <a-col :span="24">
        <a-card>
          <a-row>
            <a-col :span="8">
              <a-statistic title="总阅读量" :value="statistic.viewCount">
                <template #suffix>
                  <UserOutlined />
                </template>
              </a-statistic>
            </a-col>
            <a-col :span="8">
              <a-statistic title="总点赞量" :value="statistic.voteCount">
                <template #suffix>
                  <like-outlined />
                </template>
              </a-statistic>
            </a-col>
            <a-col :span="8">
              <a-statistic title="点赞率" :value="statistic.voteCount / statistic.viewCount * 100"
                           :precision="2"
                           suffix="%"
                           :value-style="{ color: '#cf1322' }">
                <template #suffix>
                  <like-outlined />
                </template>
              </a-statistic>
            </a-col>
          </a-row>
        </a-card>
      </a-col>
    </a-row>
    <br>
    <a-row :gutter="16">
      <a-col :span="12">
        <a-card>
          <a-row>
            <a-col :span="12">
              <a-statistic title="今日阅读" :value="statistic.todayViewCount" style="margin-right: 50px">
                <template #suffix>
                  <UserOutlined />
                </template>
              </a-statistic>
            </a-col>
            <a-col :span="12">
              <a-statistic title="今日点赞" :value="statistic.todayVoteCount">
                <template #suffix>
                  <like-outlined />
                </template>
              </a-statistic>
            </a-col>
          </a-row>
        </a-card>
      </a-col>
      <a-col :span="12">
        <a-card>
          <a-row>
            <a-col :span="12">
              <a-statistic
                title="预计今日阅读"
                :value="statistic.todayViewIncrease"
                :value-style="{ color: '#0000ff' }"
              >
                <template #suffix>
                  <UserOutlined />
                </template>
              </a-statistic>
            </a-col>
            <a-col :span="12">
              <a-statistic
                title="预计今日阅读增长"
                :value="statistic.todayViewIncreaseRateAbs"
                :precision="2"
                suffix="%"
                class="demo-class"
                :value-style="statistic.todayViewIncreaseRate < 0 ? { color: '#3f8600' } : { color: '#cf1322' }"
              >
                <template #prefix>
                  <arrow-down-outlined v-if="statistic.todayViewIncreaseRate < 0"/>
                  <arrow-up-outlined v-if="statistic.todayViewIncreaseRate >= 0"/>
                </template>
              </a-statistic>
            </a-col>
          </a-row>
        </a-card>
      </a-col>
    </a-row>
    <br>

    <a-row>
      <a-card style="width: 100%;height:300px">
      <a-col :span="24" id="main-col" >
        <div id="main"></div>
      </a-col>
      </a-card>
    </a-row>

    <a-row>
      <a-col :span="24">
        <a-card style="width: 100%;height:300px;margin-top: 40px">
          <div id="bookview" style="width: 100%;height:300px;"></div>
        </a-card>
      </a-col>
    </a-row>
  </div>
</template>

<script lang="ts">
  import { defineComponent, ref, onMounted } from 'vue'
  import axios from 'axios';

  declare let echarts: any;

  export default defineComponent({
    name: 'the-welcome',
    setup () {
      const statistic = ref();
      statistic.value = {};
      // 假数据生成函数
      function generateFakeData({numEntries}: { numEntries: any }) {
        const data = [];
        for (let i = 0; i < numEntries; i++) {
          data.push([
            `User ${i}`,    // 用户名
            Math.floor(Math.random() * 100), // 年龄，随机数0-99
            'Profession',   // 职业，这里简化处理为固定值
            Math.floor(Math.random() * 500), // 分数，随机数0-499
            `2011-${Math.floor(Math.random() * 12) + 1}-${Math.floor(Math.random() * 28) + 1}` // 随机日期
          ]);
        }
        return data;
      }
      /**
       * * 浏览量排行
       * */
      const initbookView =(list: any) =>{
        // 基于准备好的dom，初始化echarts实例
        const bookDom = document.getElementById('bookview');
        if(bookDom){
          bookDom.innerHTML='<div id="bookview" style="width: 100%;height:300px;"></div>';
        }
        const bookViewChart = echarts.init(document.getElementById('bookview'));
        // 指定图表的配置项和数据
        const option = {
          tooltip: {
            trigger: 'axis',
            triggerOn:"mousemove",
            axisPointer: {
              type: 'shadow'
            }
          },
          dataset: [
            {
              dimensions: ['userName', 'age', 'profession', 'score', 'date'],
              source: generateFakeData({numEntries: 10000})
            }
          ],
          dataZoom: [
            {
              type: 'inside', // 同时启用内置型数据区域缩放
              startValue: 0,       // 数据窗口范围的起始百分比
              endValue: 30,       // 数据窗口范围的结束百分比，显示前10个数据点
              zoomLock: true, // 禁止缩放
              disableMouse: true, // 禁用鼠标滚轮控制
            }
          ],
          // backgroundColor: '#0f375f',
          xAxis: {
            type: 'category',
            axisLabel: {
              interval: 0,
              formatter: function (value: string) {
                // 截取前10个字符，超出的部分显示为...
                return value.length > 10 ? value.slice(0, 10) + '...' : value;
              }
            }
          },
          yAxis: {
            splitLine: { show: false },
            axisLine: {
              lineStyle: {
                color: '#ccc'
              }
            }
          },
          series: {
            name:"飞行架次统计",
            type: 'bar',
            encode: { x: 'userName', y: 'score' },
            barWidth: 15,
            itemStyle: {
              borderRadius: 5,
              color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                { offset: 0, color: '#83bff6' },
                { offset: 0.5, color: '#188df0' },
                { offset: 1, color: '#188df0' }
              ])
            },
            datasetIndex: 0
          }
        };
        // 使用刚指定的配置项和数据显示图表。
        bookViewChart.setOption(option);
      }
      const selectbookview = () =>{
        axios.get("/ebook-snapshot/selectBookView").then((resp)=>{
          const bookviewList = resp.data.content
          console.log("bookViewList",bookviewList)
          initbookView(bookviewList)
        })
      }

      const getStatistic = () => {
        axios.get('/ebook-snapshot/get-statistic').then((response) => {
          const data = response.data;
          if (data.success) {
            const statisticResp = data.content;
            console.log("statisticResp",statisticResp)
            statistic.value.viewCount = statisticResp[0].viewCount;
            statistic.value.voteCount = statisticResp[0].voteCount;
            statistic.value.todayViewCount = statisticResp[0].viewIncrease;
            statistic.value.todayVoteCount = statisticResp[0].voteIncrease;
            // 按分钟计算当前时间点，占一天的百分比
            const now = new Date();
            const nowRate = (now.getHours() * 60 + now.getMinutes()) / (60 * 24);
            statistic.value.todayViewIncrease = parseInt(String(statisticResp[0].viewIncrease / nowRate));
            statistic.value.todayViewIncreaseRate = (statistic.value.todayViewIncrease - statisticResp[0].viewIncrease) / statisticResp[0].viewIncrease * 10;
            statistic.value.todayViewIncreaseRateAbs = Math.abs(statistic.value.todayViewIncreaseRate);
          }
        })
      }


      const init30DayEcharts = (list: any) => {
        const mainDom = document.getElementById('main-col');
        if (mainDom) {
          mainDom.innerHTML = '<div id="main" style="width: 100%;height:300px;"></div>';
        }
        // 基于准备好的dom，初始化echarts实例
        const myChart = echarts.init(document.getElementById('main'));

        const xAxis = [];
        const seriesView = [];
        const seriesVote = [];
        for (let i = 0; i < list.length; i++) {
          const record = list[i];
          xAxis.push(record.date);
          seriesView.push(record.viewIncrease);
          seriesVote.push(record.voteIncrease);
        }

        // 指定图表的配置项和数据
        const option = {
          title: {
            text: '30天趋势图'
          },
          tooltip: {
            trigger: 'axis'
          },
          legend: {
            data: ['总阅读量', '总点赞量']
          },
          grid: {
            left: '1%',
            right: '3%',
            bottom: '3%',
            containLabel: true
          },
          toolbox: {
            feature: {
              saveAsImage: {}
            }
          },
          xAxis: {
            type: 'category',
            boundaryGap: false,
            data: xAxis
          },
          yAxis: {
            type: 'value'
          },
          series: [
            {
              name: '总阅读量',
              type: 'line',
              data: seriesView,
              smooth: true
            },
            {
              name: '总点赞量',
              type: 'line',
              data: seriesVote,
              smooth: true
            }
          ]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
      };

      const get30DayStatistic = () => {
        axios.get('/ebook-snapshot/get-30-statistic').then((response) => {
          const data = response.data;
          if (data.success) {
            const statisticList = data.content;
            console.log("30天",statisticList)
            init30DayEcharts(statisticList)
          }
        });
      };


      onMounted(() => {
        getStatistic();
        get30DayStatistic();
        selectbookview();
      });

      return {
        statistic,
        initbookView
      }
    }
  });
</script>
<style scoped>
  .tip {
    padding: 10px 5px;
    margin-bottom: 20px;
    color: red;
    border: 1px solid transparent;
    background: linear-gradient(white,white) padding-box,repeating-linear-gradient(-45deg, black 0, black 25%, white 0, white 50%) 0/.6em .6em;
    animation:ants 12s linear infinite;
  }
</style>
