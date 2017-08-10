package po;

import java.util.ArrayList;
import java.util.List;

public class JdProdimgExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public JdProdimgExample() {
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

        public Criteria andPimgidIsNull() {
            addCriterion("pimgid is null");
            return (Criteria) this;
        }

        public Criteria andPimgidIsNotNull() {
            addCriterion("pimgid is not null");
            return (Criteria) this;
        }

        public Criteria andPimgidEqualTo(Integer value) {
            addCriterion("pimgid =", value, "pimgid");
            return (Criteria) this;
        }

        public Criteria andPimgidNotEqualTo(Integer value) {
            addCriterion("pimgid <>", value, "pimgid");
            return (Criteria) this;
        }

        public Criteria andPimgidGreaterThan(Integer value) {
            addCriterion("pimgid >", value, "pimgid");
            return (Criteria) this;
        }

        public Criteria andPimgidGreaterThanOrEqualTo(Integer value) {
            addCriterion("pimgid >=", value, "pimgid");
            return (Criteria) this;
        }

        public Criteria andPimgidLessThan(Integer value) {
            addCriterion("pimgid <", value, "pimgid");
            return (Criteria) this;
        }

        public Criteria andPimgidLessThanOrEqualTo(Integer value) {
            addCriterion("pimgid <=", value, "pimgid");
            return (Criteria) this;
        }

        public Criteria andPimgidIn(List<Integer> values) {
            addCriterion("pimgid in", values, "pimgid");
            return (Criteria) this;
        }

        public Criteria andPimgidNotIn(List<Integer> values) {
            addCriterion("pimgid not in", values, "pimgid");
            return (Criteria) this;
        }

        public Criteria andPimgidBetween(Integer value1, Integer value2) {
            addCriterion("pimgid between", value1, value2, "pimgid");
            return (Criteria) this;
        }

        public Criteria andPimgidNotBetween(Integer value1, Integer value2) {
            addCriterion("pimgid not between", value1, value2, "pimgid");
            return (Criteria) this;
        }

        public Criteria andImgIsNull() {
            addCriterion("img is null");
            return (Criteria) this;
        }

        public Criteria andImgIsNotNull() {
            addCriterion("img is not null");
            return (Criteria) this;
        }

        public Criteria andImgEqualTo(String value) {
            addCriterion("img =", value, "img");
            return (Criteria) this;
        }

        public Criteria andImgNotEqualTo(String value) {
            addCriterion("img <>", value, "img");
            return (Criteria) this;
        }

        public Criteria andImgGreaterThan(String value) {
            addCriterion("img >", value, "img");
            return (Criteria) this;
        }

        public Criteria andImgGreaterThanOrEqualTo(String value) {
            addCriterion("img >=", value, "img");
            return (Criteria) this;
        }

        public Criteria andImgLessThan(String value) {
            addCriterion("img <", value, "img");
            return (Criteria) this;
        }

        public Criteria andImgLessThanOrEqualTo(String value) {
            addCriterion("img <=", value, "img");
            return (Criteria) this;
        }

        public Criteria andImgLike(String value) {
            addCriterion("img like", value, "img");
            return (Criteria) this;
        }

        public Criteria andImgNotLike(String value) {
            addCriterion("img not like", value, "img");
            return (Criteria) this;
        }

        public Criteria andImgIn(List<String> values) {
            addCriterion("img in", values, "img");
            return (Criteria) this;
        }

        public Criteria andImgNotIn(List<String> values) {
            addCriterion("img not in", values, "img");
            return (Criteria) this;
        }

        public Criteria andImgBetween(String value1, String value2) {
            addCriterion("img between", value1, value2, "img");
            return (Criteria) this;
        }

        public Criteria andImgNotBetween(String value1, String value2) {
            addCriterion("img not between", value1, value2, "img");
            return (Criteria) this;
        }

        public Criteria andInameIsNull() {
            addCriterion("iname is null");
            return (Criteria) this;
        }

        public Criteria andInameIsNotNull() {
            addCriterion("iname is not null");
            return (Criteria) this;
        }

        public Criteria andInameEqualTo(String value) {
            addCriterion("iname =", value, "iname");
            return (Criteria) this;
        }

        public Criteria andInameNotEqualTo(String value) {
            addCriterion("iname <>", value, "iname");
            return (Criteria) this;
        }

        public Criteria andInameGreaterThan(String value) {
            addCriterion("iname >", value, "iname");
            return (Criteria) this;
        }

        public Criteria andInameGreaterThanOrEqualTo(String value) {
            addCriterion("iname >=", value, "iname");
            return (Criteria) this;
        }

        public Criteria andInameLessThan(String value) {
            addCriterion("iname <", value, "iname");
            return (Criteria) this;
        }

        public Criteria andInameLessThanOrEqualTo(String value) {
            addCriterion("iname <=", value, "iname");
            return (Criteria) this;
        }

        public Criteria andInameLike(String value) {
            addCriterion("iname like", value, "iname");
            return (Criteria) this;
        }

        public Criteria andInameNotLike(String value) {
            addCriterion("iname not like", value, "iname");
            return (Criteria) this;
        }

        public Criteria andInameIn(List<String> values) {
            addCriterion("iname in", values, "iname");
            return (Criteria) this;
        }

        public Criteria andInameNotIn(List<String> values) {
            addCriterion("iname not in", values, "iname");
            return (Criteria) this;
        }

        public Criteria andInameBetween(String value1, String value2) {
            addCriterion("iname between", value1, value2, "iname");
            return (Criteria) this;
        }

        public Criteria andInameNotBetween(String value1, String value2) {
            addCriterion("iname not between", value1, value2, "iname");
            return (Criteria) this;
        }

        public Criteria andProidIsNull() {
            addCriterion("proid is null");
            return (Criteria) this;
        }

        public Criteria andProidIsNotNull() {
            addCriterion("proid is not null");
            return (Criteria) this;
        }

        public Criteria andProidEqualTo(Integer value) {
            addCriterion("proid =", value, "proid");
            return (Criteria) this;
        }

        public Criteria andProidNotEqualTo(Integer value) {
            addCriterion("proid <>", value, "proid");
            return (Criteria) this;
        }

        public Criteria andProidGreaterThan(Integer value) {
            addCriterion("proid >", value, "proid");
            return (Criteria) this;
        }

        public Criteria andProidGreaterThanOrEqualTo(Integer value) {
            addCriterion("proid >=", value, "proid");
            return (Criteria) this;
        }

        public Criteria andProidLessThan(Integer value) {
            addCriterion("proid <", value, "proid");
            return (Criteria) this;
        }

        public Criteria andProidLessThanOrEqualTo(Integer value) {
            addCriterion("proid <=", value, "proid");
            return (Criteria) this;
        }

        public Criteria andProidIn(List<Integer> values) {
            addCriterion("proid in", values, "proid");
            return (Criteria) this;
        }

        public Criteria andProidNotIn(List<Integer> values) {
            addCriterion("proid not in", values, "proid");
            return (Criteria) this;
        }

        public Criteria andProidBetween(Integer value1, Integer value2) {
            addCriterion("proid between", value1, value2, "proid");
            return (Criteria) this;
        }

        public Criteria andProidNotBetween(Integer value1, Integer value2) {
            addCriterion("proid not between", value1, value2, "proid");
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