package po;

import java.util.ArrayList;
import java.util.List;

public class JdProdsExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public JdProdsExample() {
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

        public Criteria andNameIsNull() {
            addCriterion("name is null");
            return (Criteria) this;
        }

        public Criteria andNameIsNotNull() {
            addCriterion("name is not null");
            return (Criteria) this;
        }

        public Criteria andNameEqualTo(String value) {
            addCriterion("name =", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotEqualTo(String value) {
            addCriterion("name <>", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThan(String value) {
            addCriterion("name >", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThanOrEqualTo(String value) {
            addCriterion("name >=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThan(String value) {
            addCriterion("name <", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThanOrEqualTo(String value) {
            addCriterion("name <=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLike(String value) {
            addCriterion("name like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotLike(String value) {
            addCriterion("name not like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameIn(List<String> values) {
            addCriterion("name in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotIn(List<String> values) {
            addCriterion("name not in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameBetween(String value1, String value2) {
            addCriterion("name between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotBetween(String value1, String value2) {
            addCriterion("name not between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andBrandIsNull() {
            addCriterion("brand is null");
            return (Criteria) this;
        }

        public Criteria andBrandIsNotNull() {
            addCriterion("brand is not null");
            return (Criteria) this;
        }

        public Criteria andBrandEqualTo(String value) {
            addCriterion("brand =", value, "brand");
            return (Criteria) this;
        }

        public Criteria andBrandNotEqualTo(String value) {
            addCriterion("brand <>", value, "brand");
            return (Criteria) this;
        }

        public Criteria andBrandGreaterThan(String value) {
            addCriterion("brand >", value, "brand");
            return (Criteria) this;
        }

        public Criteria andBrandGreaterThanOrEqualTo(String value) {
            addCriterion("brand >=", value, "brand");
            return (Criteria) this;
        }

        public Criteria andBrandLessThan(String value) {
            addCriterion("brand <", value, "brand");
            return (Criteria) this;
        }

        public Criteria andBrandLessThanOrEqualTo(String value) {
            addCriterion("brand <=", value, "brand");
            return (Criteria) this;
        }

        public Criteria andBrandLike(String value) {
            addCriterion("brand like", value, "brand");
            return (Criteria) this;
        }

        public Criteria andBrandNotLike(String value) {
            addCriterion("brand not like", value, "brand");
            return (Criteria) this;
        }

        public Criteria andBrandIn(List<String> values) {
            addCriterion("brand in", values, "brand");
            return (Criteria) this;
        }

        public Criteria andBrandNotIn(List<String> values) {
            addCriterion("brand not in", values, "brand");
            return (Criteria) this;
        }

        public Criteria andBrandBetween(String value1, String value2) {
            addCriterion("brand between", value1, value2, "brand");
            return (Criteria) this;
        }

        public Criteria andBrandNotBetween(String value1, String value2) {
            addCriterion("brand not between", value1, value2, "brand");
            return (Criteria) this;
        }

        public Criteria andPromessageIsNull() {
            addCriterion("promessage is null");
            return (Criteria) this;
        }

        public Criteria andPromessageIsNotNull() {
            addCriterion("promessage is not null");
            return (Criteria) this;
        }

        public Criteria andPromessageEqualTo(String value) {
            addCriterion("promessage =", value, "promessage");
            return (Criteria) this;
        }

        public Criteria andPromessageNotEqualTo(String value) {
            addCriterion("promessage <>", value, "promessage");
            return (Criteria) this;
        }

        public Criteria andPromessageGreaterThan(String value) {
            addCriterion("promessage >", value, "promessage");
            return (Criteria) this;
        }

        public Criteria andPromessageGreaterThanOrEqualTo(String value) {
            addCriterion("promessage >=", value, "promessage");
            return (Criteria) this;
        }

        public Criteria andPromessageLessThan(String value) {
            addCriterion("promessage <", value, "promessage");
            return (Criteria) this;
        }

        public Criteria andPromessageLessThanOrEqualTo(String value) {
            addCriterion("promessage <=", value, "promessage");
            return (Criteria) this;
        }

        public Criteria andPromessageLike(String value) {
            addCriterion("promessage like", value, "promessage");
            return (Criteria) this;
        }

        public Criteria andPromessageNotLike(String value) {
            addCriterion("promessage not like", value, "promessage");
            return (Criteria) this;
        }

        public Criteria andPromessageIn(List<String> values) {
            addCriterion("promessage in", values, "promessage");
            return (Criteria) this;
        }

        public Criteria andPromessageNotIn(List<String> values) {
            addCriterion("promessage not in", values, "promessage");
            return (Criteria) this;
        }

        public Criteria andPromessageBetween(String value1, String value2) {
            addCriterion("promessage between", value1, value2, "promessage");
            return (Criteria) this;
        }

        public Criteria andPromessageNotBetween(String value1, String value2) {
            addCriterion("promessage not between", value1, value2, "promessage");
            return (Criteria) this;
        }

        public Criteria andPriceIsNull() {
            addCriterion("price is null");
            return (Criteria) this;
        }

        public Criteria andPriceIsNotNull() {
            addCriterion("price is not null");
            return (Criteria) this;
        }

        public Criteria andPriceEqualTo(String value) {
            addCriterion("price =", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotEqualTo(String value) {
            addCriterion("price <>", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceGreaterThan(String value) {
            addCriterion("price >", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceGreaterThanOrEqualTo(String value) {
            addCriterion("price >=", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceLessThan(String value) {
            addCriterion("price <", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceLessThanOrEqualTo(String value) {
            addCriterion("price <=", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceLike(String value) {
            addCriterion("price like", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotLike(String value) {
            addCriterion("price not like", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceIn(List<String> values) {
            addCriterion("price in", values, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotIn(List<String> values) {
            addCriterion("price not in", values, "price");
            return (Criteria) this;
        }

        public Criteria andPriceBetween(String value1, String value2) {
            addCriterion("price between", value1, value2, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotBetween(String value1, String value2) {
            addCriterion("price not between", value1, value2, "price");
            return (Criteria) this;
        }

        public Criteria andDiscountIsNull() {
            addCriterion("discount is null");
            return (Criteria) this;
        }

        public Criteria andDiscountIsNotNull() {
            addCriterion("discount is not null");
            return (Criteria) this;
        }

        public Criteria andDiscountEqualTo(String value) {
            addCriterion("discount =", value, "discount");
            return (Criteria) this;
        }

        public Criteria andDiscountNotEqualTo(String value) {
            addCriterion("discount <>", value, "discount");
            return (Criteria) this;
        }

        public Criteria andDiscountGreaterThan(String value) {
            addCriterion("discount >", value, "discount");
            return (Criteria) this;
        }

        public Criteria andDiscountGreaterThanOrEqualTo(String value) {
            addCriterion("discount >=", value, "discount");
            return (Criteria) this;
        }

        public Criteria andDiscountLessThan(String value) {
            addCriterion("discount <", value, "discount");
            return (Criteria) this;
        }

        public Criteria andDiscountLessThanOrEqualTo(String value) {
            addCriterion("discount <=", value, "discount");
            return (Criteria) this;
        }

        public Criteria andDiscountLike(String value) {
            addCriterion("discount like", value, "discount");
            return (Criteria) this;
        }

        public Criteria andDiscountNotLike(String value) {
            addCriterion("discount not like", value, "discount");
            return (Criteria) this;
        }

        public Criteria andDiscountIn(List<String> values) {
            addCriterion("discount in", values, "discount");
            return (Criteria) this;
        }

        public Criteria andDiscountNotIn(List<String> values) {
            addCriterion("discount not in", values, "discount");
            return (Criteria) this;
        }

        public Criteria andDiscountBetween(String value1, String value2) {
            addCriterion("discount between", value1, value2, "discount");
            return (Criteria) this;
        }

        public Criteria andDiscountNotBetween(String value1, String value2) {
            addCriterion("discount not between", value1, value2, "discount");
            return (Criteria) this;
        }

        public Criteria andStoidIsNull() {
            addCriterion("stoid is null");
            return (Criteria) this;
        }

        public Criteria andStoidIsNotNull() {
            addCriterion("stoid is not null");
            return (Criteria) this;
        }

        public Criteria andStoidEqualTo(Integer value) {
            addCriterion("stoid =", value, "stoid");
            return (Criteria) this;
        }

        public Criteria andStoidNotEqualTo(Integer value) {
            addCriterion("stoid <>", value, "stoid");
            return (Criteria) this;
        }

        public Criteria andStoidGreaterThan(Integer value) {
            addCriterion("stoid >", value, "stoid");
            return (Criteria) this;
        }

        public Criteria andStoidGreaterThanOrEqualTo(Integer value) {
            addCriterion("stoid >=", value, "stoid");
            return (Criteria) this;
        }

        public Criteria andStoidLessThan(Integer value) {
            addCriterion("stoid <", value, "stoid");
            return (Criteria) this;
        }

        public Criteria andStoidLessThanOrEqualTo(Integer value) {
            addCriterion("stoid <=", value, "stoid");
            return (Criteria) this;
        }

        public Criteria andStoidIn(List<Integer> values) {
            addCriterion("stoid in", values, "stoid");
            return (Criteria) this;
        }

        public Criteria andStoidNotIn(List<Integer> values) {
            addCriterion("stoid not in", values, "stoid");
            return (Criteria) this;
        }

        public Criteria andStoidBetween(Integer value1, Integer value2) {
            addCriterion("stoid between", value1, value2, "stoid");
            return (Criteria) this;
        }

        public Criteria andStoidNotBetween(Integer value1, Integer value2) {
            addCriterion("stoid not between", value1, value2, "stoid");
            return (Criteria) this;
        }

        public Criteria andZimgIsNull() {
            addCriterion("zimg is null");
            return (Criteria) this;
        }

        public Criteria andZimgIsNotNull() {
            addCriterion("zimg is not null");
            return (Criteria) this;
        }

        public Criteria andZimgEqualTo(String value) {
            addCriterion("zimg =", value, "zimg");
            return (Criteria) this;
        }

        public Criteria andZimgNotEqualTo(String value) {
            addCriterion("zimg <>", value, "zimg");
            return (Criteria) this;
        }

        public Criteria andZimgGreaterThan(String value) {
            addCriterion("zimg >", value, "zimg");
            return (Criteria) this;
        }

        public Criteria andZimgGreaterThanOrEqualTo(String value) {
            addCriterion("zimg >=", value, "zimg");
            return (Criteria) this;
        }

        public Criteria andZimgLessThan(String value) {
            addCriterion("zimg <", value, "zimg");
            return (Criteria) this;
        }

        public Criteria andZimgLessThanOrEqualTo(String value) {
            addCriterion("zimg <=", value, "zimg");
            return (Criteria) this;
        }

        public Criteria andZimgLike(String value) {
            addCriterion("zimg like", value, "zimg");
            return (Criteria) this;
        }

        public Criteria andZimgNotLike(String value) {
            addCriterion("zimg not like", value, "zimg");
            return (Criteria) this;
        }

        public Criteria andZimgIn(List<String> values) {
            addCriterion("zimg in", values, "zimg");
            return (Criteria) this;
        }

        public Criteria andZimgNotIn(List<String> values) {
            addCriterion("zimg not in", values, "zimg");
            return (Criteria) this;
        }

        public Criteria andZimgBetween(String value1, String value2) {
            addCriterion("zimg between", value1, value2, "zimg");
            return (Criteria) this;
        }

        public Criteria andZimgNotBetween(String value1, String value2) {
            addCriterion("zimg not between", value1, value2, "zimg");
            return (Criteria) this;
        }

        public Criteria andThidIsNull() {
            addCriterion("thid is null");
            return (Criteria) this;
        }

        public Criteria andThidIsNotNull() {
            addCriterion("thid is not null");
            return (Criteria) this;
        }

        public Criteria andThidEqualTo(Integer value) {
            addCriterion("thid =", value, "thid");
            return (Criteria) this;
        }

        public Criteria andThidNotEqualTo(Integer value) {
            addCriterion("thid <>", value, "thid");
            return (Criteria) this;
        }

        public Criteria andThidGreaterThan(Integer value) {
            addCriterion("thid >", value, "thid");
            return (Criteria) this;
        }

        public Criteria andThidGreaterThanOrEqualTo(Integer value) {
            addCriterion("thid >=", value, "thid");
            return (Criteria) this;
        }

        public Criteria andThidLessThan(Integer value) {
            addCriterion("thid <", value, "thid");
            return (Criteria) this;
        }

        public Criteria andThidLessThanOrEqualTo(Integer value) {
            addCriterion("thid <=", value, "thid");
            return (Criteria) this;
        }

        public Criteria andThidIn(List<Integer> values) {
            addCriterion("thid in", values, "thid");
            return (Criteria) this;
        }

        public Criteria andThidNotIn(List<Integer> values) {
            addCriterion("thid not in", values, "thid");
            return (Criteria) this;
        }

        public Criteria andThidBetween(Integer value1, Integer value2) {
            addCriterion("thid between", value1, value2, "thid");
            return (Criteria) this;
        }

        public Criteria andThidNotBetween(Integer value1, Integer value2) {
            addCriterion("thid not between", value1, value2, "thid");
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