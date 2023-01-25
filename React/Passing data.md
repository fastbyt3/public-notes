# Using Properties

- `this.props.<name>` can be used to specify values from parent to child
- eg:

```js
class IssueRow extends Component {
    render() {
        return (
            <tr>
                <td>{this.props.issue_no}</td>
                <td>{this.props.issue_name}</td>
            </tr>
        )
    }
}

class IssueTable extends Component {
    render() {
        return (
            <table>
            <tr><IssueRow issue_no={1} issue_name="Issue 1" /></tr>
            <tr><IssueRow issue_no={2} issue_name="Issue 2" /></tr>
        )
    }
}
```


## Property validation

- similar to how we explicitly define data type in Java, ...
- use diff constants provided in `React.PropTypes`
- ex: 
    ```JS
    IssueRow.propTypes = {  
        issue_id: React.PropTypes.number.isRequired,  
        issue_title: React.PropTypes.string  
    };
    ```

    ```JS
    // class { 
    // ...  
        static get propTypes() {  
            return {  
                issue_id: React.PropTypes.number.isRequired,  
                issue_title: React.PropTypes.string  
            };  
        }  
    // ...
    ```
- validations are performed only in dev env and warnings are reported in console when validation fails
- setting default values:

    ```js
    IssueRow.defaultProps = {
        issue_name: '--- no name ---',
    }
    ```


# Using children

- `this.props.children` 

```js
// IssueRow
// ,,,
render() {
    return (
        <tr>
            <td style={borderStyle}>{this.props.issue_id}</td>
            <td style={borderStyle}>{this.props.children}</td>
        </tr>
    )
}
// ,,,

// ...
<IssueRow issue_id={1}>Issue 1 goes here</IssueRow>
```


# Dynamic Composition

