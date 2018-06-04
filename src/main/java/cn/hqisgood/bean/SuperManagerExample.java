package cn.hqisgood.bean;

import java.util.ArrayList;
import java.util.List;

public class SuperManagerExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SuperManagerExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andSuperIdIsNull() {
            addCriterion("super_id is null");
            return (Criteria) this;
        }

        public Criteria andSuperIdIsNotNull() {
            addCriterion("super_id is not null");
            return (Criteria) this;
        }

        public Criteria andSuperIdEqualTo(Integer value) {
            addCriterion("super_id =", value, "superId");
            return (Criteria) this;
        }

        public Criteria andSuperIdNotEqualTo(Integer value) {
            addCriterion("super_id <>", value, "superId");
            return (Criteria) this;
        }

        public Criteria andSuperIdGreaterThan(Integer value) {
            addCriterion("super_id >", value, "superId");
            return (Criteria) this;
        }

        public Criteria andSuperIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("super_id >=", value, "superId");
            return (Criteria) this;
        }

        public Criteria andSuperIdLessThan(Integer value) {
            addCriterion("super_id <", value, "superId");
            return (Criteria) this;
        }

        public Criteria andSuperIdLessThanOrEqualTo(Integer value) {
            addCriterion("super_id <=", value, "superId");
            return (Criteria) this;
        }

        public Criteria andSuperIdIn(List<Integer> values) {
            addCriterion("super_id in", values, "superId");
            return (Criteria) this;
        }

        public Criteria andSuperIdNotIn(List<Integer> values) {
            addCriterion("super_id not in", values, "superId");
            return (Criteria) this;
        }

        public Criteria andSuperIdBetween(Integer value1, Integer value2) {
            addCriterion("super_id between", value1, value2, "superId");
            return (Criteria) this;
        }

        public Criteria andSuperIdNotBetween(Integer value1, Integer value2) {
            addCriterion("super_id not between", value1, value2, "superId");
            return (Criteria) this;
        }

        public Criteria andSuperNameIsNull() {
            addCriterion("super_name is null");
            return (Criteria) this;
        }

        public Criteria andSuperNameIsNotNull() {
            addCriterion("super_name is not null");
            return (Criteria) this;
        }

        public Criteria andSuperNameEqualTo(String value) {
            addCriterion("super_name =", value, "superName");
            return (Criteria) this;
        }

        public Criteria andSuperNameNotEqualTo(String value) {
            addCriterion("super_name <>", value, "superName");
            return (Criteria) this;
        }

        public Criteria andSuperNameGreaterThan(String value) {
            addCriterion("super_name >", value, "superName");
            return (Criteria) this;
        }

        public Criteria andSuperNameGreaterThanOrEqualTo(String value) {
            addCriterion("super_name >=", value, "superName");
            return (Criteria) this;
        }

        public Criteria andSuperNameLessThan(String value) {
            addCriterion("super_name <", value, "superName");
            return (Criteria) this;
        }

        public Criteria andSuperNameLessThanOrEqualTo(String value) {
            addCriterion("super_name <=", value, "superName");
            return (Criteria) this;
        }

        public Criteria andSuperNameLike(String value) {
            addCriterion("super_name like", value, "superName");
            return (Criteria) this;
        }

        public Criteria andSuperNameNotLike(String value) {
            addCriterion("super_name not like", value, "superName");
            return (Criteria) this;
        }

        public Criteria andSuperNameIn(List<String> values) {
            addCriterion("super_name in", values, "superName");
            return (Criteria) this;
        }

        public Criteria andSuperNameNotIn(List<String> values) {
            addCriterion("super_name not in", values, "superName");
            return (Criteria) this;
        }

        public Criteria andSuperNameBetween(String value1, String value2) {
            addCriterion("super_name between", value1, value2, "superName");
            return (Criteria) this;
        }

        public Criteria andSuperNameNotBetween(String value1, String value2) {
            addCriterion("super_name not between", value1, value2, "superName");
            return (Criteria) this;
        }

        public Criteria andSuperPasswordIsNull() {
            addCriterion("super_password is null");
            return (Criteria) this;
        }

        public Criteria andSuperPasswordIsNotNull() {
            addCriterion("super_password is not null");
            return (Criteria) this;
        }

        public Criteria andSuperPasswordEqualTo(String value) {
            addCriterion("super_password =", value, "superPassword");
            return (Criteria) this;
        }

        public Criteria andSuperPasswordNotEqualTo(String value) {
            addCriterion("super_password <>", value, "superPassword");
            return (Criteria) this;
        }

        public Criteria andSuperPasswordGreaterThan(String value) {
            addCriterion("super_password >", value, "superPassword");
            return (Criteria) this;
        }

        public Criteria andSuperPasswordGreaterThanOrEqualTo(String value) {
            addCriterion("super_password >=", value, "superPassword");
            return (Criteria) this;
        }

        public Criteria andSuperPasswordLessThan(String value) {
            addCriterion("super_password <", value, "superPassword");
            return (Criteria) this;
        }

        public Criteria andSuperPasswordLessThanOrEqualTo(String value) {
            addCriterion("super_password <=", value, "superPassword");
            return (Criteria) this;
        }

        public Criteria andSuperPasswordLike(String value) {
            addCriterion("super_password like", value, "superPassword");
            return (Criteria) this;
        }

        public Criteria andSuperPasswordNotLike(String value) {
            addCriterion("super_password not like", value, "superPassword");
            return (Criteria) this;
        }

        public Criteria andSuperPasswordIn(List<String> values) {
            addCriterion("super_password in", values, "superPassword");
            return (Criteria) this;
        }

        public Criteria andSuperPasswordNotIn(List<String> values) {
            addCriterion("super_password not in", values, "superPassword");
            return (Criteria) this;
        }

        public Criteria andSuperPasswordBetween(String value1, String value2) {
            addCriterion("super_password between", value1, value2, "superPassword");
            return (Criteria) this;
        }

        public Criteria andSuperPasswordNotBetween(String value1, String value2) {
            addCriterion("super_password not between", value1, value2, "superPassword");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}