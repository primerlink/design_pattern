#关于下文中{}与（）的不良用法说明：
#1、承如徐海兵先生译文所述，应保文件中()与{}用法的一致性。
#2、本实例中之所以没有在环境中统一()与{}的用法，但秉承：
#   （）用于函数调用
#    {}用于变量
#   原因在于：bash中区分（）与{}，so……

include rule.mk
target = mytest
GCC = g++

.PHONY : all
all : ${target}

${target} : ${objects}
	${Q}${GCC} -o $@ $^

#注意：
#	include 放在最终目标关系之下，否则会造成将include文件的目标作为最终目标
ifneq ($(filter-out distclean clean tags, ${MAKECMDGOALS}), )
-include ${depends}
endif
ifeq (${MAKECMDGOALS}, )
sinclude ${depends}
endif

#1、此处主要生成cpp与h之间的依赖关系
#   一般情况下，cpp与h之间没有什么依赖关系,
#   在depened.sh中主要是在命令行写明：如相关的h文件变化，则更新cpp的时间戳,
#   从而使得目标文件也变化.
#2、当然我们也可以轻松地写出：%.d, %.o: %.cpp的规则，承如徐海兵先生译文所示；
#   此处则采用如上1中解释所述的规则（自造）.
#3、使用续航符，以使得在同一shell进程中执行.
#4、@放在行首.
${DEP}/%.d : ${CUR_DIR}/%.cpp
	${Q}${GCC} -MM ${CFLAGS} $<  -MF $@; \
	mv $@ $@.$$$$; \
	/bin/bash tools/depend.sh $@.$$$$ > $@; \
	rm $@.$$$$

${OBJ}/%.o : ${CUR_DIR}/%.cpp
	${Q} ${GCC} -c ${CFLAGS} $< -o $@


.PHONY : distclean clean tags
distclean : clean
	-$(RM) -r tags

clean :
	-$(RM) -r ${target} ${OBJ} ${DEP}

tags :
	ctags -R

.PHONY: FROCE
FORCE : ;
